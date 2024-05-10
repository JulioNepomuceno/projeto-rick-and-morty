import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/models/item_location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/service/location_service.dart';

class LocationController extends ChangeNotifier{
  
   Timer? _debounce;
  final LocationService _service = LocationService();
  var itens = const <ItemLocationdioModel>[];
  List<Location> location = [];


  Future<List<Location>> getAllLocation(String? search) async {
    try {
      location = await _service.getAllLocations(search);
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

   void onSearchDebounce(String? search) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      getAllLocation(search);
    });
  }


}