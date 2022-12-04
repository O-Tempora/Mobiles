import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/user/user.dart';
part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task{
  String description;
  List<String> tags;
  List<User> members;
  String groupName;
  bool isDone;

  Task({required this.description, required this.tags, required this.members, required this.groupName, required this.isDone});
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}