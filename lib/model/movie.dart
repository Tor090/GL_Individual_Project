import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'movie.g.dart';

@JsonSerializable()
@entity
class Movie{
   @PrimaryKey(autoGenerate: true)
   final int? uid;
  // @primaryKey
  final int id;
  final String posterPath;
  final String title;
  String label = '';
  int ganre = 0;


  Movie({
    this.uid,
      required this.id,
      required this.posterPath,
      required this.title
      });


  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}