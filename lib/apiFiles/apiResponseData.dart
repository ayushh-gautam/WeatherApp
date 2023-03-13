// // ignore_for_file: file_names

class WeatherData {
  final double? temperature;
  final String? city;
  final String? country;
  int? sunrise;
  int? sunset;
  final double? humidity;
  final double? speed;
  final double? feels;
  final double? pressure;

  WeatherData({
    this.temperature,
    this.city,
    this.country,
    this.sunrise,
    this.sunset,
    this.humidity,
    this.speed,
    this.feels,
    this.pressure,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      city: json['name'],
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'].toDouble(),
      speed: json['wind']['speed'].toDouble(),
      feels: json['main']['feels_like'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
    );
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: MyWidget(),
//         ),
//       ),
//     );
//   }
// }

// class WeatherData {
//   final String cityName;
//   final double temperature;
//   final String description;

//   WeatherData(
//       {required this.cityName,
//       required this.temperature,
//       required this.description});

//   factory WeatherData.fromJson(Map<String, dynamic> json) {
//     return WeatherData(
//       cityName: json['name'],
//       temperature: json['main']["temp"].toDouble(),
//       description: json['weather'][0]['description'],
//     );
//   }
// }

// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   WeatherData? _weatherData;

//   Future<WeatherData> fetchWeatherData() async {
//     final response = await http.get(Uri.parse(
//         ''));
//     if (response.statusCode == 200) {
//       return WeatherData.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeatherData().then((value) {
//       setState(() {
//         _weatherData = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _weatherData != null
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   _weatherData!.cityName,
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   '${_weatherData!.temperature.toStringAsFixed(1)}°C',
//                   style: TextStyle(fontSize: 24),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   _weatherData!.description,
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ],
//             )
//           : CircularProgressIndicator(),
//     );
//   }
// }
