class Movie{
  final int id;
  final String posterPath;
  final String title;


  Movie({
      required this.id,
      required this.posterPath,
      required this.title
      });


  factory Movie.fromJson(dynamic json) {

    return Movie(
        id: json['id'],
        posterPath: json['poster_path'],
        title: json['title']
        );
  }
}