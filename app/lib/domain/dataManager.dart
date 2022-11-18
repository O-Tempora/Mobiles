import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<io.File> get _usersFile async {
    print("Ищем путь");
    final path = await _localPath;
    print("Нашли путь");
    io.File file;
    if (await io.File('$path/users.json').exists()){
      file = io.File('$path/users.json');
    } else {
      io.File('$path/users.json').create(recursive: true);
      file = io.File('$path/users.json');
    }
    return file;
  }

  seedUsers() async{
    var _users = List<User>.empty(growable: true);
    _users.add(User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"));
    _users.add(User(login:"Log In 2", name:"Dima Vasilyev", email:"ifhc32ufc2@gmail.com", password:"12345qwerty"));
    _users.add(User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5"));
    print("Сидируем");

    final file = await _usersFile;
    await file.writeAsString(json.encode(_users));
  }

  Future<List<dynamic>>readUsers() async{
    String fileContent = "";
    print("Пытаемся");
    var file = await _usersFile;

    if (await file.exists()){
      print("Оно есть");
      fileContent = await file.readAsString();
      if (fileContent.isEmpty){
        print("Пизда");
        seedUsers();
        fileContent = await file.readAsString();
      }
    }
    print("Прочитали пользователей");
    var dec = json.decode(fileContent);
    print(dec);
    return dec;
  }

class User{
  User({required this.login, required this.name, required this.email, required this.password});
  String login;
  String name;
  String email;
  String password;
  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json['login'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'name': name,
        'email': email,
        'password': password
      };
}