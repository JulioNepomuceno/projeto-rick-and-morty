import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';
import 'package:projeto_rick_and_morty/app/modules/character/service/character_service.dart';

class CharacterController extends ChangeNotifier {
  final CharacterService _service = CharacterService();

  Timer? _debounce;
  List<Character> character = [];

  Future<List<Character>> getAllCharacter(String? search) async {
    try {
      character = await _service.getAllCharacters(search);
      notifyListeners();
      return character;
    } catch (e) {
      rethrow;
    }
  }

  void onSearchDebounce(String? search) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      getAllCharacter(search);
    });
  }
}
