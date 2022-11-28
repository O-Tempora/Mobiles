import 'package:app/domain/userManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/domain/user/user.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<User> userList = List<User>.empty(growable: true);

  GetAllUsers() async{
    userList = await getUsers();
    setState(() {});
  }
  DeleteUser(String login) async{
    await deleteUser(login);
  }

  @override
  void initState() {
    GetAllUsers();
    super.initState();
  }

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
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 12,
                    color: Theme.of(context).primaryColor,
                    margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
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
                        padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                        child: Text(
                          userList[index].login, 
                          style: const TextStyle(
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
                            padding: const EdgeInsets.fromLTRB(0, 4, 2, 4),
                            child: Text(
                              userList[index].name, 
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 14, 
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 2, 4),
                            child: Text(
                              userList[index].email, 
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 14, 
                                fontStyle: FontStyle.italic
                              )
                            ),
                          ),
                        ]
                      ),
                      trailing: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        onTap: () => {
                          setState(() {
                            DeleteUser(userList[index].login);
                            userList.removeAt(index);
                          },)
                        },
                        child: const Icon(
                          Icons.delete_forever, 
                          size: 40, 
                          color: Color.fromARGB(255, 211, 71, 90)
                        ),
                      )
                    )
                  );
                },
              ),
            )
          ]
        ),
      )
    );
  }
}