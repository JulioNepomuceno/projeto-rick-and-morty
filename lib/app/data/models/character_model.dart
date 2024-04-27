class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  String created;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.image,
      required this.created});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ,
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
      created: json['created'],
    );
  }
}
