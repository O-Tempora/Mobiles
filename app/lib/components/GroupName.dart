import 'package:flutter/material.dart';

class GroupName extends StatelessWidget {
  const GroupName({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: const Padding(
          padding: EdgeInsets.all(2),
          child: Text('Done', style: TextStyle(color: Colors.black))
        )
      ),
    );
  }
}