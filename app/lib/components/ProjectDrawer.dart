import 'package:flutter/material.dart';

class ProjectDrawer extends StatefulWidget {
  const ProjectDrawer({super.key});

  @override
  State<ProjectDrawer> createState() => _ProjectDrawerState();
}

class _ProjectDrawerState extends State<ProjectDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(14, 70, 73, 1.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0)),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color:const Color.fromRGBO(80, 20, 73, 1.0),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            title: Text('Project1', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0)),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Project2', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0)),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Project3', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0)),),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}