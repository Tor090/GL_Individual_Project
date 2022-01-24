class Person {
  final String id;
  final String gender;
  final String name;
  final String biography;
  final String profilePath;
  final String birthday;
  final String popularity;

  Person(
      {required this.id,
        required this.gender,
        required this.name,
        required this.birthday,
        required this.profilePath,
        required this.biography,
        required this.popularity});

  factory Person.fromJson(dynamic json) {


    return Person(
        id: json['id'].toString(),
        gender: json['gender'].toString(),
        name: json['name'],
        biography: json['biography'],
        profilePath: json['profile_path'],
        birthday: json['birthday'],
        popularity: json['popularity'].toString());
  }
}