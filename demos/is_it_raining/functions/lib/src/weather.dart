import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.open-meteo.com/v1/forecast';

Future<String> getWeather(DateTime now) async {
  final uri = Uri.parse(
    '$baseUrl?latitude=56.1567&longitude=10.2108'
    '&hourly=weather_code&forecast_days=1'
    '&models=dmi_seamless'
    '&timezone=Europe%2FCopenhagen',
  );

  final response = await http.get(uri);
  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final hourly = data['hourly'] as Map<String, dynamic>;
  final weatherCode = (hourly['weather_code'] as List).cast<int>();

  return weatherDescription(weatherCode[now.hour]);
}

String weatherDescription(int code) => switch (code) {
  0 => 'sunny',
  1 || 2 => 'somewhat sunny',
  3 => 'cloudy',
  45 || 48 => 'foggy',
  (>= 51 && <= 69) || 80 || 81 || 82 => 'raining',
  (>= 71 && <= 79) || 85 || 86 => 'snowing',
  >= 95 && <= 99 => 'thundery',
  _ => 'unknown',
};
