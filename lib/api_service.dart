import 'dart:convert';
import 'package:http/http.dart' as http;
import 'surah_model.dart';

class ApiService {
  Future<List<Surah>> getSurah() async {
    final response = await http.get(Uri.parse("https://quran-api.santrikoding.com/api/surah/"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json)=>Surah.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
