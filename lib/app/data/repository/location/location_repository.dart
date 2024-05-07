import 'package:http/http.dart' as http;
import 'package:projeto_rick_and_morty/app/data/provider/client_api.dart';

class LocationRepository{
  
  final ApiClient _apiClient = ApiClient();

  Future<http.Response> getLocations()async{
    return await _apiClient.get('location' );
  }

}