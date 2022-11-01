import 'package:flutter/material.dart';
import 'package:app/components/GroupName.dart';
import 'package:app/components/AddButton.dart';
import 'package:app/components/Task.dart';

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
        width: 220,
        child: Column(
          children: [
            GroupName(),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  Task(),
                  AddButton()
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}