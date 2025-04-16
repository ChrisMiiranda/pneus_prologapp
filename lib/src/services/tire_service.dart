import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tire.dart';

class TireService {
  static const String _baseUrl = 'https://prologapp.com/prolog/api/v3';
  static const String _token = 'ePTC2XrkY34WKUCXq48fTxrLCzdV3M35MNpCfBYavabwwY9BJXg';

  static Future<List<Tire>> getTires({
    List<int> branchOfficesId = const [215],
    int pageSize = 100,
    int pageNumber = 0,
  }) async {
    final uri = Uri.https(
      'prologapp.com',
      '/prolog/api/v3/tires',
      {
        'branchOfficesId': branchOfficesId.join(','),
        'pageSize': '$pageSize',
        'pageNumber': '$pageNumber',
      },
    );

    try {
      final response = await http.get(
        uri,
        headers: {
          'x-prolog-api-token': _token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['content'] != null && jsonData['content'] is List) {
          final List<dynamic> content = jsonData['content'];

          return content
              .where((e) => e != null)
              .map((e) => Tire.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          print('Resposta sem conteúdo esperado: ${response.body}');
          return [];
        }
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }

  static Future<Tire?> getTireById(int id) async {
    final uri = Uri.parse('$_baseUrl/tires/$id');

    try {
      final response = await http.get(
        uri,
        headers: {
          'x-prolog-api-token': _token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Tire.fromJson(data);
      } else {
        print('Erro ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Erro ao buscar pneu $id: $e');
      return null;
    }
  }
}
