import 'package:app/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: logo()
          ),
          fields()
        ],
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
            const Text('Enter account information', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.normal, 
                color: Color.fromRGBO(212, 190, 242, 1.0),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: SvgPicture.asset('assets/Reg.svg', width: double.infinity,)
              )
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
                hintText: 'Email',
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
                  hintText: 'Login',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic)
                ),
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
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Repeat password',
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
                      MaterialPageRoute(builder:(context) => const AuthenticationPage())
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
      )
    );
  }
}