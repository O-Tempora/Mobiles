// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      description: json['description'] as String,
      name: json['name'] as String,
      repository: json['repository'] as String,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'repository': instance.repository,
    };
