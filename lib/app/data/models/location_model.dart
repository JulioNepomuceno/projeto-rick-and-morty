class Location {
  int id;
  String name;
  String type;
  String dimension;

  Location(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
    );
  }
}
