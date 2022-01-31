// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      name: json['name'] as String,
      profilePath: json['profile_path'] == null ? null :
      'https://image.tmdb.org/t/p/w500/${json['profile_path'] as String}',
      id: json['id'] as int,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'id': instance.id,
    };
