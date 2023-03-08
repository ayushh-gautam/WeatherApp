import 'dart:convert';
import 'package:http/http.dart' as http;
import 'apiResponseData.dart';

const apiKey = '4c4b664fe4018cf1d877668bd30c7fef';

class WeatherClient {
  Future<WeatherData> getApiData(double? latitude, double? longitude) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var response = await http.get(url);
    var body = await jsonDecode(response.body);

    WeatherData users = WeatherData.fromJson(body);
    return users;
  }
}
