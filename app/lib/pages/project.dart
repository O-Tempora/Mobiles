import 'package:flutter/material.dart';
import 'package:app/components/AddButton.dart';
import 'package:app/components/GroupName.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: navBar(),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 200,
              height: double.maxFinite,
              child: Column(
                children: [
                  GroupName(),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.black,
                          margin: EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ),
                  GroupName()
                ]
              ),
            )
          ],
        )
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
          size: 35.0
        ),
        onPressed: (){},
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: Colors.black54
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    onPressed: (){}, 
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
                    onPressed: (){},
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
                    onPressed: (){},
                  ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
