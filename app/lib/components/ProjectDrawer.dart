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
      width: 250,
      backgroundColor: Color.fromARGB(255, 39, 41, 41),
      child: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            height: 110,
            child: DrawerHeader(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 25, 26, 26),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Your projects',
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold, 
                    fontStyle: FontStyle.italic, 
                    fontSize: 26
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(2),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Card(
                    color: Color.fromARGB(255, 39, 41, 41),
                    elevation: 16,
                    child: ListTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Mobiles course work', 
                          style: TextStyle(
                            color: Color.fromRGBO(212, 190, 242, 1.0), 
                            fontSize: 16
                          )
                        )
                      ),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Card(
                    color: Color.fromARGB(255, 39, 41, 41),
                    elevation: 16,
                    child: ListTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Diploma', 
                          style: TextStyle(
                            color: Color.fromRGBO(212, 190, 242, 1.0), 
                            fontSize: 16
                          )
                        )
                      ),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Card(
                    color: Color.fromARGB(255, 39, 41, 41),
                    elevation: 16,
                    child: ListTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Pomogite', 
                          style: TextStyle(
                            color: Color.fromRGBO(212, 190, 242, 1.0), 
                            fontSize: 16
                          )
                        )
                      ),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}