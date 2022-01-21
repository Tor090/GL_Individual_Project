class Ganre{
  final int id;
  final String name;

  Ganre({required this.id, required this.name});

  factory Ganre.fromJson(dynamic json) {

    return Ganre(id: json['id'], name: json['name']);
  }
}