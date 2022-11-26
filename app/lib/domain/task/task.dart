import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/user/user.dart';
part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task{
  String description;
  List<String> tags;
  List<User> members;
  String groupName;

  Task({required this.description, required this.tags, required this.members, required this.groupName});
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}