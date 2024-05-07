import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/models/item_location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/service/location_service.dart';

class LocationController extends ChangeNotifier{
  
  final LocationService _service = LocationService();
  var itens = const <ItemLocationdioModel>[];

  List<Location> location = [];


  Future<List<Location>> getAllLocation() async {
    try {
      location = await _service.getAllLocations();
      itens = location.map((location) => ItemLocationdioModel(name: location.name, type: location.type, dimension: location.dimension)).toList();
      notifyListeners();
      return location;
    } catch (e) {
      rethrow;
    }
  }

    void expansionCallback(int index, bool isExpanded) {
    itens[index].isExpanded = !isExpanded;
    notifyListeners();
  }


}