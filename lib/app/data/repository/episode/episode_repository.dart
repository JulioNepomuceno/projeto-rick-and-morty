import 'package:http/http.dart' as http;
import 'package:projeto_rick_and_morty/app/data/provider/client_api.dart';

class EpisodeRepository{

  final ApiClient _apiClient = ApiClient();

  Future<http.Response> getEpisodes(String? search)async{
    return await _apiClient.get('episode', params:{'name':search} );
  }
}