class Episode {
  int id;
  String name;
  String air_date;
  String episode;
  String created;

  Episode(
      {required this.id,
      required this.name,
      required this.air_date,
      required this.episode,
      required this.created});


  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] ,
      name: json['name'],
      air_date: json['air_date'],
      episode: json['episode'],
      created: json['created'],
    );
  }
}
