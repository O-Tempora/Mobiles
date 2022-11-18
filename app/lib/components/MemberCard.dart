import 'package:flutter/material.dart';

class MemberCard extends StatefulWidget {

  final String login;
  final String name;
  final String email;
  const MemberCard(this.login, this.name, this.email);

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: const Icon(
          Icons.person_pin_circle_outlined, 
          size: 40, 
          color: Color.fromARGB(255, 156, 221, 103)
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
          child: Text(
            widget.login, 
            style: TextStyle(
              color: Color.fromARGB(255, 199, 118, 236), 
              fontSize: 20, 
              fontWeight: FontWeight.w600
            ),
          )
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 4, 2, 4),
              child: Text(
                widget.name, 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 14, 
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 4, 2, 4),
              child: Text(
                widget.email, 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 14, 
                  fontStyle: FontStyle.italic
                )
              ),
            ),
          ]
        ),
        trailing: Icon(
          Icons.delete_forever, 
          size: 40, 
          color: Color.fromARGB(255, 211, 71, 90)
        )
      )
    );
  }
}