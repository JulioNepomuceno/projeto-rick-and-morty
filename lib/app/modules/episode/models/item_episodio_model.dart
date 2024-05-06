class ItemEspisodioModel {

  String name;
  String air_date;
  String episode;
  bool isExpanded;

  ItemEspisodioModel({required this.name, required this.air_date, required this.episode, this.isExpanded = false});

}