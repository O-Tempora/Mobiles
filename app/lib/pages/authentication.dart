import 'package:app/pages/project.dart';
import 'package:app/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: logo()
          ),
          fields()
        ]
      ),
    );
  }

  Widget logo(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            const Text('Project Manager App', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.normal, 
                color: Color.fromRGBO(212, 190, 242, 1.0),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SvgPicture.asset('assets/Auth.svg', height: 200, width: double.infinity)
            )
          ],
        )
      )
    );
  }

  Widget fields(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                hintText: 'Login',
                hintStyle: const TextStyle(fontStyle: FontStyle.italic)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(138, 117, 159, 1.0)
                    )
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const ProjectPage())
                    )
                  },
                  child: const Text('Sign In', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  )
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Haven’t registered before? You can create a new account:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                  color: Colors.white
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(138, 117, 159, 1.0)
                    )
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const RegistrationPage())
                    )
                  },
                  child: const Text('Sign Up', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  )
                )
              )
            ),
          ],
        )
      ),
    );
  }
}
