import 'package:http/http.dart' as http;
import 'package:projeto_rick_and_morty/app/data/provider/rest_interface.dart';

class ApiClient implements Rest{

  final _baseUrl = 'rickandmortyapi.com';
  final header = {'Content-Type': 'application/json'};


  @override
  Future<http.Response> get(String path, {Map<String, dynamic>? params}) async{
    final url = Uri.http(_baseUrl, '/api/$path',params);
    return await http.get(url, headers: header);
  }

}