
import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/episode_model.dart';
import 'package:projeto_rick_and_morty/app/modules/episode/models/item_episodio_model.dart';
import 'package:projeto_rick_and_morty/app/modules/episode/service/episode_service.dart';

class EpisodeController extends ChangeNotifier {

  List<Episode> episode = [];
  var itens = const <ItemEspisodioModel>[];

  final EpisodeService _service = EpisodeService();

  Future<List<Episode>> getAllEpisode() async {
    try {
      episode = await _service.getAllEpisodes();
      itens = episode.map((episode) => ItemEspisodioModel(name: episode.name, air_date: episode.air_date, episode: episode.episode)).toList();
      notifyListeners();
      return episode;
    } catch (e) {
      rethrow;
    }
  }

  void expansionCallback(int index, bool isExpanded) {
    itens[index].isExpanded = !isExpanded;
    notifyListeners();
  }

}
