import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Model.dart';

class Repository {
  Future<List<Daftar>> getData({required int page, required int perPage}) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> dataList = data['data'];
      return dataList.map((json) => Daftar.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
