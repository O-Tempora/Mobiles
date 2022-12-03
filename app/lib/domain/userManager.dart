import 'package:app/domain/user/user.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<io.File> get _userFile async {
  final path = await _localPath;
  io.File file;
  if (await io.File('$path/users.json').exists()){
    file = io.File('$path/users.json');
  } else {
    io.File('$path/users.json').create(recursive: true);
    file = io.File('$path/users.json');
    var users = List<User>.empty(growable: true);
    users.add(User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"));
    users.add(User(login:"Log In 2", name:"Dima Vasilyev", email:"ifhc32ufc2@gmail.com", password:"12345qwerty"));
    users.add(User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5"));
    users.add(User(login:"Admin", name:"AdminAdmin", email:"admin@gmail.com", password:"adminadmin"));
    file.writeAsString(jsonEncode(users.map((e) => e.toJson()).toList()));
  }
  return file;
}

Future<List<User>> getUsers() async{
  final file = await _userFile;
  var userObjects = jsonDecode(await file.readAsString()) as List;
  List<User> lu = userObjects.map((user) => User.fromJson(user)).toList();
  return lu;
} 

Future<User> getUserByLogin(String login) async{
  final file = await _userFile;
  var userObjects = jsonDecode(await file.readAsString()) as List;
  var users = userObjects.map((user) => User.fromJson(user)).toList();
  for (var v in users){
    if (v.login == login){
      return v;
    } 
  }
  return User(name: "", login: "", email: "", password: "");
} 

Future<void> deleteUser(String login) async{
  final file = await _userFile;
  var userObjects = jsonDecode(await file.readAsString()) as List;
  var users = userObjects.map((user) => User.fromJson(user)).toList();
  users.removeWhere((element) => element.login == login);
  file.writeAsString(jsonEncode(users.map((e) => e.toJson()).toList()));
  return;
}

Future<bool> authenticateUser(String login, String password) async{
  var users = await getUsers();
  bool flag = false;
  users.forEach((element) {
    if (element.login == login && element.password == password){
      flag = true;
    }
  });
  return flag;
}

Future<bool> checkUserByLogin(String login) async{
  var users = await getUsers();
  bool flag = true;
  users.forEach((element) { 
    if (element.login == login){
      flag = false;
    }
  });
  return flag;
}

Future createAccount(String name, String login, String password, String email) async{
  var users = await getUsers();
  final file = await _userFile;
  users.add(User(name: name, login: login, email: email, password: password));
  file.writeAsString(jsonEncode(users.map((e) => e.toJson()).toList()));
}