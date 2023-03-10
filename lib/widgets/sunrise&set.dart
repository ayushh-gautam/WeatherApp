// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/widgets/allWidgets.dart';

import '../apiFiles/apiResponseData.dart';

class SunRiseSet extends StatelessWidget {
  const SunRiseSet({
    super.key,
    required Future<WeatherData?>? futureData,
  }) : _futureData = futureData;

  final Future<WeatherData?>? _futureData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textWidget(
            name: 'Sunrise', fontsize: 20.0, fontweight: FontWeight.w600),
        SizedBox(
          height: 15,
        ),
        FutureBuilder<WeatherData?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Colors.white,
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              );
            } else if (snapshot.hasData) {
              return Text(
                DateFormat.jm().format(
                  DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data!.sunrise! * 1000,
                      isUtc: false),
                ),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              );
            } else {
              return Text(
                'No Data',
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ],
    );
  }
}

class SunSet extends StatelessWidget {
  const SunSet({
    super.key,
    required Future<WeatherData?>? futureData,
  }) : _futureData = futureData;

  final Future<WeatherData?>? _futureData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textWidget(name: 'Sunset', fontsize: 20.0, fontweight: FontWeight.w600),
        SizedBox(
          height: 15,
        ),
        FutureBuilder<WeatherData?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Colors.white,
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              );
            } else if (snapshot.hasData) {
              return Text(
                DateFormat.jm().format(
                  DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data!.sunset! * 1000,
                      isUtc: false),
                ),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              );
            } else {
              return Text(
                'No Data',
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ],
    );
  }
}
