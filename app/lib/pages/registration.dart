import 'package:app/domain/userManager.dart';
import 'package:app/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool emailIsOk = true;
  bool loginIsOk = true;
  bool passwordIsOk = true;
  bool nameIsOk = true;
  bool repeatIsOk = true;

  void SetAllTrue(){
    emailIsOk = loginIsOk = passwordIsOk = nameIsOk = repeatIsOk = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
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
      return Flexible(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                hintText: 'Email',
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                errorText: emailIsOk? null : "Некорректная почта",
                errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Name',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  errorText: nameIsOk? null : "Некорректное имя пользователя",
                  errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: loginController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Login',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  errorText: loginIsOk? null : "Данное имя пользователя недоступно",
                  errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  errorText: passwordIsOk? null : "Недопустимый пароль",
                  errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: repeatPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  hintText: 'Repeat password',
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  errorText: repeatIsOk? null : "Пароли не совпадают",
                  errorStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
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
                  onPressed: () async{
                    SetAllTrue();
                    var loginOk = await checkUserByLogin(loginController.text);
                    if (loginController.text.isEmpty || !loginOk){
                      loginIsOk = false;
                    }
                    if (nameController.text.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(nameController.text)){
                      nameIsOk = false;
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)){
                      emailIsOk = false;
                    }
                    if (passwordController.text.isEmpty){
                      passwordIsOk = false;
                    }
                    if (repeatPasswordController.text != passwordController.text){
                      repeatIsOk = false;
                    }

                    if (loginOk && nameIsOk && emailIsOk && passwordIsOk && repeatIsOk){
                      await createAccount(nameController.text, loginController.text, passwordController.text, emailController.text);
                      setState(() {
                        SetAllTrue();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => const AuthenticationPage())
                        );
                      });
                    }
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
          ),
      );
  }
}