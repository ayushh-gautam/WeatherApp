// // ignore_for_file: file_names

class Weather {
  final double? temperature;
  final String? city;
  final String? country;

  Weather({this.temperature, this.city, this.country});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      city: json['name'],
      country: json['sys']['country'],
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
//         'https://api.openweathermap.org/data/2.5/weather?q=biratnagar&appid=4c4b664fe4018cf1d877668bd30c7fef'));
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
