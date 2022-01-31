import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable()
class Cast {
  final String name;
  final String? profilePath;
  final int id;

  Cast({required this.name, required this.profilePath, required this.id});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}