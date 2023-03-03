// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFFFD056), borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(left: 40, right: 40),
      width: double.infinity,
      height: 60.0,
      child: Center(
        child: Text(
          'Get Started',
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Days Widget

class dayText extends StatelessWidget {
  String? kDays;
  Color? kColor;
  dayText({
    @required this.kDays,
    @required this.kColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      kDays.toString(),
      style:
          TextStyle(color: kColor, fontSize: 21, fontWeight: FontWeight.bold),
    );
  }
}

// Weather box

class Forecast extends StatelessWidget {
String? kTime;
String? kTemperature;
  Forecast({@required this.kTime, @required this.kTemperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF22224A), borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(left: 30),
      height: 130,
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.topRight,
            child: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              kTime.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              kTemperature.toString(),
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          )
        ],
      ),
    );
  }
}
