import 'package:ecommerce/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class weatherService {
  final String apikey = '41d5f1bb3e5dab012df2a16d1a825eec';

  Future<weather> featchweather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}