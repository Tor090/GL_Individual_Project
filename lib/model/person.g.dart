// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int,
      gender: json['gender'] == null ? null : json['gender'] as int,
      name: json['name'] as String,
      birthday: json['birthday'] == null ? 'Empty' : json['birthday'] as String,
      profilePath: json['profile_path'] == null
          ? null
          : 'https://image.tmdb.org/t/p/w500/${json['profile_path'] as String}',
      biography:
          json['biography'] == null ? 'Empty' : json['biography'] as String,
      popularity:
          json['popularity'] == null ? null : json['popularity'] as double,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'biography': instance.biography,
      'profile_path': instance.profilePath,
      'birthday': instance.birthday,
      'popularity': instance.popularity,
    };
