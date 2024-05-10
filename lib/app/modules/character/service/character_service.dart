import 'dart:convert';
import 'dart:developer';

import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';
import 'package:projeto_rick_and_morty/app/data/repository/character/character_repository.dart';

import '../../../data/errors/exceptions.dart';

class CharacterService {
  final CharacterRepository _characherRepository = CharacterRepository();

  Future<List<Character>> getAllCharacters(String? search) async {
    try {
      final response = await _characherRepository.getCharacters(search);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final characters = (data['results'] as List).map((json) => Character.fromJson(json)).toList();
        return characters;
      } else {
        throw NotFoundException('erro ao carregar personagens');
      }
    } catch (e, s) {
      log('Erro ao fazer o get dos personagens', error: e, stackTrace: s);
      throw NotFoundException('erro ao carregar personagens');
    }
  }
}
