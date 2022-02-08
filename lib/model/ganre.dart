import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ganre.g.dart';

@JsonSerializable()
@entity
class Ganre{
  @primaryKey
  final int id;
  final String name;

  Ganre({required this.id, required this.name});

  factory Ganre.fromJson(Map<String, dynamic> json) => _$GanreFromJson(json);

  Map<String, dynamic> toJson() => _$GanreToJson(this);
}