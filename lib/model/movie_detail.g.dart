// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      id: json['id'] as int,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] == null
          ? null
          : 'https://image.tmdb.org/t/p/w500/${json['backdrop_path'] as String}',
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] == null ? 'Empty' : json['overview'] as String,
      releaseDate: json['release_date'] == ''
          ? ''
          : '(${json['release_date'].toString().substring(0, 4)})',
      voteAverage: json['vote_average'] as double?,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'movieScreenshot': instance.movieScreenshot,
      'castList': instance.castList,
    };
