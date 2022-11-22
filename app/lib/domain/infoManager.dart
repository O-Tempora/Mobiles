import 'package:app/domain/user.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/info/info.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<io.File> get _infoFile async {
  final path = await _localPath;
  io.File file;
  if (await io.File('$path/info.json').exists()){
    file = io.File('$path/info.json');
  } else {
    io.File('$path/info.json').create(recursive: true);
    file = io.File('$path/info.json');
    var projInfo = Info(description: "Это тестовый проект, предназначенный для проверки работы с флаттером и чтения/записи данных", 
                        name: "Тестовый курсовой проект по мобилкам", 
                        repository: "https://github.com/O-Tempora/Mobiles");
    file.writeAsString(jsonEncode(projInfo));
  }
  return file;
}

Future<Info> getInfo() async{
  final file = await _infoFile;
  Info info = Info.fromJson(jsonDecode(await file.readAsString()));
  return info;
} 

Future<void> updateInfo(Info inf) async{
  final file = await _infoFile;
  file.writeAsString(jsonEncode(inf));
}
