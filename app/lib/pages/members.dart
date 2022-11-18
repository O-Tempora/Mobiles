import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/components/MemberCard.dart';
import 'package:app/domain/dataManager.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  var _users = List<User>.empty();
  var userItems = readUsers();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Members',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: SvgPicture.asset('assets/Members.svg', width: double.infinity,)
            ),
            Flexible(
              child: ListView(
                children: 
                  // MemberCard(),
                  // MemberCard(),
                  // MemberCard(),
                  // MemberCard(),
                  // MemberCard(),
                  // MemberCard(),
                  _users.map((e) => MemberCard(e.login, e.name, e.email)).toList(),
              ),
            )
          ]
        ),
      )
    );
  }
}