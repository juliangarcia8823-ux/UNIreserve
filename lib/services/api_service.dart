import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080/api';

  String? _token;

  void setToken(String token) {
    _token = token;
  }

  Map<String, String> get _headers {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    if (_token != null && _token!.isNotEmpty) {
      headers['Authorization'] = 'Bearer $_token';
    }

    return headers;
  }

  Future<List<dynamic>> getSpaces() async {
    final response = await http.get(
      Uri.parse('$baseUrl/spaces'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Error al consultar espacios: ${response.statusCode}',
      );
    }

    return jsonDecode(response.body) as List<dynamic>;
  }

  Future<Map<String, dynamic>> getSpace(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/spaces/$id'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Error al consultar el espacio: ${response.statusCode}',
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
