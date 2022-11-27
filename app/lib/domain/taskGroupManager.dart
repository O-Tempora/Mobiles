import 'package:app/domain/user/user.dart';
import 'package:app/pages/taskDetailed.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/info/info.dart';
import 'package:app/domain/task/task.dart';
import 'package:app/domain/taskGroup/taskGroup.dart';

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
    
    var taskGroups = <List<TaskGroup>>[];

    var groups = <TaskGroup>[
      TaskGroup(
        name: "Срочные", 
        tasks: <Task>[
          Task(description: "Сделать окно задачи покрасивее, а то неинтересно как-то жить нам в этом мире получается",
              groupName: "Срочные",
              tags: <String>["Необязательно", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ]
          ),
          Task(description: "Добавить комментарии надо бы к задачке, а то ну как без общения сами понимаете слабоватенькие ребятулечки",
              groupName: "Срочные",
              tags: <String>["До выходных", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345")]
          ),
          Task(description: "А что-то у нас не авторизуется пользователь, надо чтобы авторизовался, евреи ведь проникнут в прогу и задачи наши украдут, вооооооооооот",
              groupName: "Срочные",
              tags: <String>["Необязательно", "бипки"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ]
          ),
        ], 
        color: 0xf46749
      ),
    ];
    taskGroups.add(groups);

    var groups2 = <TaskGroup>[
      TaskGroup(
        name: "Тестик", 
        tasks: <Task>[
          Task(description: "Если честно, я не понимаю что происходит, но вообще пару мешапов забавных нашел c первым классом, надо бы послушать",
              groupName: "Тестик",
              tags: <String>["бипки", "шиза"],
              members: <User>[User(login:"OriginalLogin1", name:"Valera Semyonov", email:"dy311rd638@gmail.com", password:"qwerty12345"),
                              User(login:"Lmaodel", name:"Vova Vist", email:"udolbru123@gmail.com", password:"q1w2e3r4t5")
              ]
          ),
        ], 
        color: 0x49f468
      ),
    ];
    taskGroups.add(groups2);

    file.writeAsString(jsonEncode(taskGroups.map((e) => e.map((l) => l.toJson()).toList()).toList()));
    return file;
  }
}

Future<List<TaskGroup>> getTasks() async{
  final file = await _taskFile;
  var tasks = jsonDecode(await file.readAsString()) as List;

  var t = <TaskGroup>[];
  tasks.forEach((element) {
    var tasks = TaskGroup.fromJson(element[0]);
    t.add(tasks);
  });
  return t;
} 

// Future<void> updateInfo(Info inf) async{
//   final file = await _taskFile;
//   file.writeAsString(jsonEncode(inf));
// }
