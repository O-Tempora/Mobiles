import 'package:app/domain/taskGroupManager.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/task/task.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/userManager.dart';

class TaskDetailed extends StatefulWidget {
  final Task task;
  final int index;
  const TaskDetailed({super.key, required this.task, required this.index});

  @override
  State<TaskDetailed> createState() => _TaskDetailedState();
}

class _TaskDetailedState extends State<TaskDetailed> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController newTagController = TextEditingController();
  List<User> userList = List<User>.empty(growable: true);
  List<User> actualUserList = List<User>.empty(growable: true);

  GetAllUsers() async{
    userList = await getUsers();
    setState(() {});
  }

  @override
  void initState(){
    GetAllUsers();
    setState(() {
      descriptionController.text = widget.task.description;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(212, 190, 242, 1.0),
            fontSize: 32,
            fontStyle: FontStyle.italic
          )
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.pop(context)
          },
        ), 
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onFocusChange: (value) {
                  if (value == false){
                    updateTask(widget.index, widget.task.groupName, descriptionController.text);
                  }
                },
                child: TextField(
                  controller: descriptionController,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).primaryColor,
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.person_pin_rounded, 
                            color: Color.fromRGBO(212, 190, 242, 1.0),
                            size: 28,
                          )
                        ),
                        TextSpan(
                          text: 'Members:',
                          style: TextStyle(
                            color: Color.fromRGBO(212, 190, 242, 1.0),
                            fontSize: 24
                          )
                        ),
                      ]
                    )
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 12, 10, 4),
                    shrinkWrap: true,
                    itemCount: widget.task.members.length + 1,
                    itemBuilder:(context, index) {
                      if (index == widget.task.members.length){
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.add_box, color: Color.fromRGBO(212, 190, 242, 1.0)),
                              label: const Text('Add', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                              onPressed: (){
                                actualUserList = userList;
                                for(var e in widget.task.members){
                                  actualUserList.removeWhere((element) => element.login == e.login);
                                }
                                showDialog<void>(
                                  context: context ,
                                  builder:(BuildContext context){ 
                                    return AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 41, 42, 44),
                                      title: const Text(
                                        textAlign: TextAlign.center,
                                        'Choose member',
                                        style: TextStyle(
                                          color: Color.fromRGBO(212, 190, 242, 1.0),
                                          fontSize: 20
                                        )
                                      ),
                                      content: SizedBox(
                                        width: 300,
                                        height: 400,
                                        child: ListView.builder(
                                          itemCount: actualUserList.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                addMember(widget.task.groupName, widget.index, User(name: actualUserList[index].name, login: actualUserList[index].login, email: actualUserList[index].email, password: actualUserList[index].password));
                                                setState(() {
                                                  widget.task.members.add(User(name: actualUserList[index].name, login: actualUserList[index].login, email: actualUserList[index].email, password: actualUserList[index].password));
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Card(
                                                elevation: 12,
                                                color: Theme.of(context).primaryColor,
                                                margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: ListTile(
                                                  leading: const Icon(
                                                    Icons.check, 
                                                    size: 28, 
                                                    color: Color.fromARGB(255, 156, 221, 103)
                                                  ),
                                                  title: Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                                                    child: Text(
                                                      userList[index].login, 
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(255, 199, 118, 236), 
                                                        fontSize: 18, 
                                                        fontWeight: FontWeight.w600
                                                      ),
                                                    )
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.fromLTRB(0, 4, 2, 4),
                                                        child: Text(
                                                          userList[index].name, 
                                                          style: const TextStyle(
                                                            color: Colors.white, 
                                                            fontSize: 14, 
                                                          )
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.fromLTRB(0, 4, 2, 4),
                                                        child: Text(
                                                          userList[index].email, 
                                                          style: const TextStyle(
                                                            color: Colors.white, 
                                                            fontSize: 14, 
                                                            fontStyle: FontStyle.italic
                                                          )
                                                        ),
                                                      ),
                                                    ]
                                                  ),
                                                )
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
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
                                );
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
                      else {
                        return InkWell(
                          onLongPress: () => showDialog<void>(
                            context: context,
                            builder:(BuildContext context){ 
                              return AlertDialog(
                                backgroundColor: const Color.fromARGB(255, 41, 42, 44),
                                title: const Text(
                                  textAlign: TextAlign.center,
                                  'Delete member?',
                                  style: TextStyle(
                                    color: Color.fromRGBO(212, 190, 242, 1.0),
                                    fontSize: 20
                                  )
                                ),
                                actions: <Widget>[
                                  OutlinedButton(
                                    onPressed: (() {
                                      removeMember(widget.task.groupName, widget.index, index);
                                      setState(() {
                                        widget.task.members.removeAt(index);
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
                          ),
                          child: Text(
                            widget.task.members[index].login,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ); 
                      }
                    }, 
                    separatorBuilder:(context, index) => const Divider(height: 12, thickness: 1,), 
                  )
                ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.tag_sharp, 
                            color: Color.fromRGBO(212, 190, 242, 1.0),
                            size: 28,
                          )
                        ),
                        TextSpan(
                          text: 'Tags:',
                          style: TextStyle(
                            color: Color.fromRGBO(212, 190, 242, 1.0),
                            fontSize: 24
                          )
                        ),
                      ]
                    )
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(66, 12, 10, 4),
                    shrinkWrap: true,
                    itemCount: widget.task.tags.length + 1,
                    itemBuilder:(context, index) {
                      if (index == widget.task.tags.length){
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.add_box, color: Color.fromRGBO(212, 190, 242, 1.0)),
                              label: const Text('Add', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                              onPressed: (){
                                showDialog<void>(
                                  context: context ,
                                  builder:(BuildContext context){ 
                                    return AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 41, 42, 44),
                                      title: const Text(
                                        textAlign: TextAlign.center,
                                        'Print new name',
                                        style: TextStyle(
                                          color: Color.fromRGBO(212, 190, 242, 1.0),
                                          fontSize: 20
                                        )
                                      ),
                                      content: TextField(
                                        controller: newTagController,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'New tag',
                                          hintStyle: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        OutlinedButton(
                                          onPressed: (() {
                                            addTag(widget.task.groupName, widget.index, newTagController.text);
                                            setState(() {
                                              widget.task.tags.add(newTagController.text);
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
                                );
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
                      else {
                        return InkWell(
                          onLongPress: () => showDialog<void>(
                            context: context ,
                            builder:(BuildContext context){ 
                              return AlertDialog(
                                backgroundColor: const Color.fromARGB(255, 41, 42, 44),
                                title: const Text(
                                  textAlign: TextAlign.center,
                                  'Delete tag?',
                                  style: TextStyle(
                                    color: Color.fromRGBO(212, 190, 242, 1.0),
                                    fontSize: 20
                                  )
                                ),
                                actions: <Widget>[
                                  OutlinedButton(
                                    onPressed: (() {
                                      removeTag(widget.task.groupName, widget.index, index);
                                      setState(() {
                                        widget.task.tags.removeAt(index);
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
                          ),
                          child: Text(
                            widget.task.tags[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        );
                      }
                    }, 
                    separatorBuilder:(context, index) => const Divider(height: 12, thickness: 1,), 
                  )
                ),
              ]
            )
          ]
        )
      )
    );
  }
}