// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskGroup _$TaskGroupFromJson(Map<String, dynamic> json) => TaskGroup(
      name: json['name'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as int,
    );

Map<String, dynamic> _$TaskGroupToJson(TaskGroup instance) => <String, dynamic>{
      'name': instance.name,
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
      'color': instance.color,
    };
