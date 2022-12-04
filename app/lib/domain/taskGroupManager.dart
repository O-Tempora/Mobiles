import 'package:app/domain/user/user.dart';
import 'package:app/pages/taskDetailed.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/info/info.dart';
import 'package:app/domain/task/task.dart';
import 'package:app/domain/taskGroup/taskGroup.dart';
import 'package:flutter/material.dart';
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<io.File> get _taskFile async {
  final path = await _localPath;
  io.File file;
  if (await io.File('$path/task.json').exists()){
    file = io.File('$path/task.json');
    return file;
  } else {
    io.File('$path/task.json').create(recursive: true);
    file = io.File('$path/task.json');
    
    var taskGroups = <TaskGroup>[];

    var groups = 
      TaskGroup(
        name: "Срочные", 
        tasks: <Task>[
          Task(description: "Сделать окно задачи покрасивее, а то неинтересно как-то жить нам в этом мире получается",
              groupName: "Срочные",
              tags: <String>["Необязательно", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ],
              isDone: false
          ),
          Task(description: "Добавить комментарии надо бы к задачке, а то ну как без общения сами понимаете слабоватенькие ребятулечки",
              groupName: "Срочные",
              tags: <String>["До выходных", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345")],
              isDone: false
          ),
          Task(description: "А что-то у нас не авторизуется пользователь, надо чтобы авторизовался, евреи ведь проникнут в прогу и задачи наши украдут, вооооооооооот",
              groupName: "Срочные",
              tags: <String>["Необязательно", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ],
              isDone: false
          ),
        ], 
        color: Color(0xb03df3d5).value
      );
    taskGroups.add(groups);

    var groups2 = 
      TaskGroup(
        name: "Тестик", 
        tasks: <Task>[
          Task(description: "Если честно, я не понимаю что происходит, но вообще пару мешапов забавных нашел c первым классом, надо бы послушать",
              groupName: "Тестик",
              tags: <String>["бипки", "шиза"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ],
              isDone: false
          ),
        ], 
        color: Color(0xb049f468).value
      );
    taskGroups.add(groups2);

    file.writeAsString(jsonEncode(taskGroups.map((e) => e.toJson()).toList()));
    return file;
  }
}

Future<List<TaskGroup>> getTasks() async{
  final file = await _taskFile;
  var tasks = jsonDecode(await file.readAsString()) as List;

  var t = <TaskGroup>[];
  tasks.forEach((element) {
    var tasks = TaskGroup.fromJson(element);
    t.add(tasks);
  });
  return t;
} 

Future addTask(int index) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups[index].tasks.insert(0, Task(description: "", tags: List<String>.empty(growable: true), members: List<User>.empty(growable: true), groupName: groups[index].name, isDone: false));
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}

// int getRandomColor(){
//   var rand = Random();
//   return Color.fromARGB(176, rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)).value;
// }

Future addGroup(String name, Color color) async{
  var groups = await getTasks();
  final file = await _taskFile;
  var group = TaskGroup(name: name, tasks: List<Task>.empty(growable: true), color: color.value);
  groups.add(group);
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
  return group;
}

Future deleteTask(int index, String groupName) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups.firstWhere((element) => element.name == groupName).tasks.removeAt(index);
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}

Future deleteGroup(int index) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups.removeAt(index);
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}

Future updateTask(int index, String groupName, String text) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups.firstWhere((element) => element.name == groupName).tasks[index].description = text;
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}

Future changeTaskStatus(int index, String groupName) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups.firstWhere((element) => element.name == groupName).tasks[index].isDone ^= true;
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}

Future renameGroup(String name, String groupName) async{
  var groups = await getTasks();
  final file = await _taskFile;
  groups.firstWhere((element) => element.name == groupName).name = name;
  file.writeAsString(jsonEncode(groups.map((e) => e.toJson()).toList()));
}
