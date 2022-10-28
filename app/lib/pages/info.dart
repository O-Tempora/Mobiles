
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
    String name = "1111111";
    String members = "2222222";
    String repo = "33333333";
  Future<void> readJson() async{
    final String response = await rootBundle.loadString("assets/test.json");
    final data = await jsonDecode(response);
    setState(() {
      name = data["name"];
      members = data["members"];
      repo = data["repo"];
    });
  }

  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Project Info',
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
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: SvgPicture.asset('assets/Info.svg', width: double.infinity,)
                )
              )
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 51, 47, 47),
                        hintText: name,
                        hintStyle: const TextStyle(
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      'Repository',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 51, 47, 47),
                        hintText: repo,
                        hintStyle: const TextStyle(
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      'Members',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 51, 47, 47),
                        hintText: members,
                        hintStyle: const TextStyle(
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}