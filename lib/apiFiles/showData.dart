// ignore_for_file: file_names


class Weather {
  final double? temperature;
  final String? city;

  Weather({this.temperature, this.city});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      city: json['name'],
    );
  }
}
