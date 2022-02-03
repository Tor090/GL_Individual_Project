// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: json['id'] as int,
  posterPath: 'https://image.tmdb.org/t/p/w500/${json['poster_path'] as String}',
  title: json['title'] as String,
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'poster_path': instance.posterPath,
  'title': instance.title,
};