import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/taskDetailed.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => const TaskDetailed())
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
            const ListTile(
              title: Text(
                'MemeTextIncomingMemeTextIncomingMemeTextIncomingMemeTextIncomingMemeTextIncomingMemeTextIncomingMemeTextIncomingMemeTextIncoming', 
                style: TextStyle(color: Colors.white, fontSize: 16), 
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
              child: const ListTile(
                leading: Icon(Icons.people_alt, color: Colors.white, size: 22),
                title: Text('Meme1, Meme2', style: TextStyle(color: Colors.white, fontSize: 16))
              ),
            ),
          ]
        )
      ),
    );
  }
}