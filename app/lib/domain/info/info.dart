import 'package:json_annotation/json_annotation.dart';
part 'info.g.dart';

@JsonSerializable(explicitToJson: true)
class Info{
  String description;
  String name;
  String repository;

  Info({required this.description, required this.name, required this.repository});
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}