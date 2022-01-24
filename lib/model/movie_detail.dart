import 'package:individual_project/model/screenshot.dart';

import 'cast.dart';

class MovieDetail {
  final int id;
  final String? title;
  final String? backdropPath;
  final String? posterPath;
  final String? budget;
  final String? originalTitle;
  final String? overview;
  final String? popularity;
  final String? releaseDate;
  final String? runtime;
  final String? voteAverage;
  final String? voteCount;

  late List<Screenshot> movieScreenshot;
  late List<Cast> castList;

  MovieDetail(
      {required this.id,
        this.title,
        this.backdropPath,
        this.posterPath,
        this.budget,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.releaseDate,
        this.runtime,
        this.voteAverage,
        this.voteCount});

  factory MovieDetail.fromJson(dynamic json) {

    return MovieDetail(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        budget: json['budget'].toString(),
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'].toString(),
        releaseDate: json['release_date'],
        runtime: json['runtime'].toString(),
        voteAverage: json['vote_average'].toString(),
        voteCount: json['vote_count'].toString());
  }

}