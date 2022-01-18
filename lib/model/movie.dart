class Movie{
  final String backdropPath;
  final int id;
  final String originalTitle;
  final double popularity;
  final String posterPath;
  final String title;


  Movie({required this.backdropPath,
      required this.id,
      required this.originalTitle,
      required this.popularity,
      required this.posterPath,
      required this.title
      });


  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      throw Exception('Json is empty');
    }

    return Movie(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalTitle: json['original_title'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        title: json['title']
        );
  }
}