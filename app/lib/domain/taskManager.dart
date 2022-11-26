import 'package:app/domain/user/user.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/info/info.dart';
import 'package:app/domain/task/task.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// Future<Info> getInfo() async{
//   final file = await _taskFile;
//   var info = Info.fromJson(jsonDecode(await file.readAsString()));
//   return info;
// } 

// Future<void> updateInfo(Info inf) async{
//   final file = await _taskFile;
//   file.writeAsString(jsonEncode(inf));
// }
