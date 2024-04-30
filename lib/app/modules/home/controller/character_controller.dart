import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';
import 'package:projeto_rick_and_morty/app/modules/home/service/character_service.dart';

class CharacterController  extends ChangeNotifier  {
  
  final CharacterService _service = CharacterService();

  List<Character> character = [];

  Future<List<Character>> getAllCharacter() async{
    try {
      character = await _service.getAllCharacters();
       notifyListeners();
      return character;
    } catch (e) {
        rethrow;
    }
  }


}