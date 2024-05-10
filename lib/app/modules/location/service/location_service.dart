import 'dart:convert';
import 'dart:developer';

import 'package:projeto_rick_and_morty/app/data/errors/exceptions.dart';
import 'package:projeto_rick_and_morty/app/data/models/location_model.dart';
import 'package:projeto_rick_and_morty/app/data/repository/location/location_repository.dart';

class LocationService{


   final LocationRepository _locationrepository = LocationRepository();

  Future<List<Location>> getAllLocations(String? search) async {
    try {
      final response = await _locationrepository.getLocations(search);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final characters = (data['results'] as List).map((json) => Location.fromJson(json)).toList();
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