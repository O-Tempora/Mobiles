import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/task/task.dart';
part 'taskGroup.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskGroup{
  String name;
  List<Task> tasks;
  int color;

  TaskGroup({required this.name, required this.tasks, required this.color});
  factory TaskGroup.fromJson(Map<String, dynamic> json) => _$TaskGroupFromJson(json);
  Map<String, dynamic> toJson() => _$TaskGroupToJson(this);
}