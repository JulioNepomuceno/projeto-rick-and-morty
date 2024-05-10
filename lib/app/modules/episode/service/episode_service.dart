import 'dart:convert';
import 'dart:developer';

import 'package:projeto_rick_and_morty/app/data/models/episode_model.dart';
import 'package:projeto_rick_and_morty/app/data/repository/episode/episode_repository.dart';

import '../../../data/errors/exceptions.dart';

class EpisodeService {
  final EpisodeRepository _episodeRepository = EpisodeRepository();

  Future<List<Episode>> getAllEpisodes() async {
    try {
      final response = await _episodeRepository.getEpisodes();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final episodes = (data['results'] as List).map((json) => Episode.fromJson(json)).toList();
        return episodes;
      } else {
        throw NotFoundException('erro ao carregar episodios');
      }
    } catch (e, s) {
      log('Erro ao fazer o get dos episodios', error: e, stackTrace: s);
      throw NotFoundException('erro ao carregar episodios');
    }
  }
}
