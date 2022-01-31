import 'package:individual_project/model/screenshot.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  final int id;
  final String? title;
  final String? backdropPath;
  final String? posterPath;
  final String overview;
  final String releaseDate;
  final double? voteAverage;

  late List<Screenshot> movieScreenshot;
  late List<Cast> castList;

  MovieDetail(
      {required this.id,
        this.title,
        this.backdropPath,
        this.posterPath,
        required this.overview,
        required this.releaseDate,
        this.voteAverage,
       });

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

}