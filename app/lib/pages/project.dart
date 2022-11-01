import 'package:app/components/ProjectDrawer.dart';
import 'package:app/components/TaskGroup.dart';
import 'package:app/pages/info.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      drawer: ProjectDrawer(),
      appBar: navBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TaskGroup()
            ],
          ),
        )
      )
    );
  }

  PreferredSizeWidget navBar(){
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('Project1',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color.fromRGBO(212, 190, 242, 1.0),
          fontSize: 32,
          fontStyle: FontStyle.italic
        )
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu, 
          color: Color.fromRGBO(212, 190, 242, 1.0), 
          size: 35.0,
        ),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                    icon: const Icon(Icons.emoji_people, color: Color.fromRGBO(212, 190, 242, 1.0)),
                    label: const Text('Members', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor
                      ),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.fromLTRB(4, 2, 8, 2)
                      )
                    ),
                    onPressed: (){}, 
                  ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.info, color: Color.fromRGBO(212, 190, 242, 1.0)),
                    label: const Text('Info', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor
                      ),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.fromLTRB(4, 2, 8, 2)
                      )
                    ),
                    onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const InfoPage())
                    )
                  },
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.task, color: Color.fromRGBO(212, 190, 242, 1.0)),
                    label: const Text('Add group', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor
                      ),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.fromLTRB(4, 2, 8, 2)
                      )
                    ),
                    onPressed: (){},
                  ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
