class Cast {
  final String name;
  final String? profilePath;
  final int id;

  Cast({required this.name, required this.profilePath, required this.id});

  factory Cast.fromJson(dynamic json) {

    return Cast(
        name: json['name'],
        profilePath: json['profile_path'],
        id: json['id']);
  }
}