import 'package:http/http.dart' as http;
import 'package:projeto_rick_and_morty/app/data/provider/client_api.dart';

class CharacterRepository{

  final ApiClient _apiClient = ApiClient();

  Future<http.Response> getCharacters(String? search)async{
    return await _apiClient.get('character', params:{'name':search} );
  }
}