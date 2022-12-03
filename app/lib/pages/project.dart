import 'package:app/components/AddButton.dart';
import 'package:app/components/ProjectDrawer.dart';
import 'package:app/domain/task/task.dart';
import 'package:app/domain/taskGroupManager.dart';
import 'package:app/pages/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/members.dart';
import 'package:app/domain/taskGroup/taskGroup.dart';
import 'package:app/pages/taskDetailed.dart';
import 'package:app/domain/user/user.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<TaskGroup> taskGroupsList = List<TaskGroup>.empty(growable: true);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GetTasks() async{
    taskGroupsList = await getTasks();
    setState(() {});
  }

  AddTask(int index) async{
    await addTask(index);
    setState(() {
    });
  }

  AddGroup(String name) async{
    var group = await addGroup(name);
    setState(() {
    });
  }

  DeleteTask(int index, String groupName) async {
    await deleteTask(index, groupName);
    setState(() {
    });
  }

  DeleteGroup(int index) async{
    await deleteGroup(index);
    setState(() {
    });
  }

  @override
  void initState() {
    GetTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      drawer: const ProjectDrawer(),
      appBar: navBar(),
      body: ListView.builder(
        itemCount: taskGroupsList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: SizedBox(
              height: double.infinity,
              width: 220,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                      child: PopupMenuButton(
                        padding: const EdgeInsets.all(0),
                        color: const Color.fromARGB(255, 31, 30, 30),
                        position: PopupMenuPosition.under,
                        tooltip: "Actions",
                        itemBuilder:(BuildContext context) => [
                          PopupMenuItem<Row>(
                            child: Row(
                              children: const [
                                Icon(Icons.edit, size: 20, color: Color.fromRGBO(212, 190, 242, 1.0)),
                                Text(' Rename group', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0)))
                              ],
                            ),
                          ),
                          PopupMenuItem<Row>(
                            child: Row(
                              children: const [
                                Icon(Icons.delete_forever, size: 20, color: Colors.red),
                                Text(' Delete group', style: TextStyle(color: Colors.red))
                              ],
                            ),
                            onTap: () {
                              DeleteGroup(index);
                              setState(() {
                                taskGroupsList.removeAt(index);
                              });
                            },
                          ),
                        ],
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(taskGroupsList[index].color),
                            borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(taskGroupsList[index].name, style: const TextStyle(color: Colors.black, fontSize: 18))
                          )
                        ),
                      ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskGroupsList[index].tasks.length + 1,
                      itemBuilder:(context, i) {
                        if (i == taskGroupsList[index].tasks.length){
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add_box, color: Color.fromRGBO(212, 190, 242, 1.0)),
                                label: const Text('Add', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                                onPressed: (){
                                  AddTask(index);
                                  setState(() {
                                    taskGroupsList[index].tasks.insert(0, Task(description: "", tags: List<String>.empty(growable: true), members: List<User>.empty(growable: true), groupName: taskGroupsList[index].name));
                                  });
                                },
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll<Color>(
                                    Color.fromRGBO(14, 70, 73, 1.0)
                                  ),
                                  padding: MaterialStatePropertyAll<EdgeInsets>(
                                    EdgeInsets.all(2)
                                  )
                                ),
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () async {
                            final value = await Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => TaskDetailed(task:taskGroupsList[index].tasks[i], index:i))
                            );
                            setState(() {
                              GetTasks();
                            });
                            //GetTasks();
                          },
                          onLongPress: () => {
                            showDialog<String>(
                              context: context ,
                              builder:(BuildContext context){ 
                                return AlertDialog(
                                  backgroundColor: const Color.fromARGB(255, 41, 42, 44),
                                  title: const Text(
                                    textAlign: TextAlign.center,
                                    'Delete task?',
                                    style: TextStyle(
                                      color: Color.fromRGBO(212, 190, 242, 1.0),
                                      fontSize: 20
                                    )
                                  ),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      onPressed: (() {
                                        DeleteTask(i, taskGroupsList[index].name);
                                        setState(() {
                                          taskGroupsList[index].tasks.removeAt(i);
                                        });
                                        Navigator.of(context).pop();
                                      }), 
                                      child: const Text(
                                        'Ok',
                                        style: TextStyle(
                                          color: Color.fromRGBO(212, 190, 242, 1.0),
                                          fontSize: 14
                                        )
                                      )
                                    ), 
                                    OutlinedButton(
                                      onPressed: (() {
                                        Navigator.of(context).pop();
                                      }), 
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Color.fromRGBO(212, 190, 242, 1.0),
                                          fontSize: 14
                                        )
                                      )
                                    ), 
                                  ]
                                );
                              } 
                            )
                          },
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            color: const Color.fromARGB(255, 41, 42, 44),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(
                                    taskGroupsList[index].tasks[i].description,
                                    style: const TextStyle(color: Colors.white, fontSize: 16), 
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis
                                  )
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          width: 1.5,
                                          color: Color.fromARGB(255, 82, 85, 88)
                                        )
                                      )
                                    ),
                                  child: ListTile(
                                    leading: const Icon(Icons.people_alt, color: Colors.white, size: 22),
                                    title: Text(
                                      taskGroupsList[index].tasks[i].members.map((e) => e.login).toList().join(',\n'), 
                                      style: const TextStyle(color: Colors.white, fontSize: 16),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                              ]
                            )
                          ),
                        ); 
                      },
                    ),
                  ),
                  //Здесь могла быть ваша кнопка;
                ]
              ),
            ),
          );
        },
      )
    );
  }







  PreferredSizeWidget navBar(){
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('Project1',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color.fromRGBO(212, 190, 242, 1.0),
          fontSize: 32,
          fontStyle: FontStyle.italic
        )
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu, 
          color: Color.fromRGBO(212, 190, 242, 1.0), 
          size: 35.0,
        ),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                    icon: const Icon(Icons.emoji_people, color: Color.fromRGBO(212, 190, 242, 1.0)),
                    label: const Text('Members', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor
                      ),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.fromLTRB(4, 2, 8, 2)
                      )
                    ),
                    onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => MembersPage())
                    )
                  }, 
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.info, color: Color.fromRGBO(212, 190, 242, 1.0)),
                    label: const Text('Info', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor
                      ),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.fromLTRB(4, 2, 8, 2)
                      )
                    ),
                    onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const InfoPage())
                    )
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.task, color: Color.fromRGBO(212, 190, 242, 1.0)),
                  label: const Text('Add group', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Theme.of(context).primaryColor
                    ),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.fromLTRB(4, 2, 8, 2)
                    )
                  ),
                  onPressed: (){
                    AddGroup(DateTime.now().minute.toString());
                    setState((){
                      taskGroupsList.add(TaskGroup(name: DateTime.now().minute.toString(), tasks: <Task>[], color: getRandomColor()));
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
