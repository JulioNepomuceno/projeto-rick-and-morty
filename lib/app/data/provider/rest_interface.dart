import 'package:http/http.dart' as http;

abstract class Rest{

  Future<http.Response> get(String path, {Map<String, dynamic>? params});
  
}