import 'package:flutter/material.dart';
import 'package:app/components/GroupName.dart';
import 'package:app/components/AddButton.dart';

class TaskGroup extends StatefulWidget {
  const TaskGroup({super.key});

  @override
  State<TaskGroup> createState() => _TaskGroupState();
}

class _TaskGroupState extends State<TaskGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: SizedBox(
        height: double.infinity,
        width: 200,
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
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                ],
              ),
            ),
            AddButton()
          ]
        ),
      ),
    );
  }
}