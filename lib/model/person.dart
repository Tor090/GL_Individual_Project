import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Equatable {
  final int id;
  final int? gender;
  final String name;
  final String biography;
  final String? profilePath;
  final String birthday;
  final double? popularity;

  Person(
      {required this.id,
      required this.gender,
      required this.name,
      required this.birthday,
      required this.profilePath,
      required this.biography,
      required this.popularity});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object?> get props => [];
}
