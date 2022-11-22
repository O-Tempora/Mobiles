import 'dart:convert';
import 'dart:ffi';
import 'package:app/domain/info/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/domain/infoManager.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Info info = Info(description: "", name: "", repository: "");
  TextEditingController nameController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController repoController = TextEditingController();

  Future<void> GetInfo() async{
    info = await getInfo();
    setState(() {
      nameController.text = info.name;
      descrController.text = info.description;
      repoController.text = info.repository;
    });
  }

  @override
  void initState(){
    GetInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    padding: EdgeInsets.fromLTRB(6, 16, 6, 6),
                    child: Text(
                      'Project Name',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(6, 16, 6, 6),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  TextField(
                    controller: descrController,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(6, 16, 6, 6),
                    child: Text(
                      'Repository',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(212, 190, 242, 1.0)
                      )
                    ),
                  ),
                  TextField(
                    controller: repoController,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                    onSubmitted: (value) {
                      info.repository = value;
                      updateInfo(info);
                    },
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.green
                      ),
                    ),
                    onPressed:() {
                      info.name = nameController.text;
                      info.description = descrController.text;
                      info.repository = repoController.text;
                      updateInfo(info);
                    }, 
                    icon: Icon(
                      Icons.check,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      'Save',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20
                      )
                    ) 
                  )
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}