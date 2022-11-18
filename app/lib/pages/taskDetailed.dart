import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TaskDetailed extends StatefulWidget {
  const TaskDetailed({super.key});

  @override
  State<TaskDetailed> createState() => _TaskDetailedState();
}

class _TaskDetailedState extends State<TaskDetailed> {
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color.fromARGB(255, 41, 42, 44),
                    width: 2
                  )
                )
              ),
              child: const Text(
                'TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1TaskDescr1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                )
              )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
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
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 2,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.catching_pokemon, 
                                    color: Colors.white,
                                    size: 26,
                                  )
                                ),
                                TextSpan(
                                  text: 'Chel', 
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 24
                                  )
                                )
                              ]
                            ), 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
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
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 2,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Chel', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 24
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            )
          ]
        )
      )
    );
  }
}