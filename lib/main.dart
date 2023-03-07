// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/pages/splashScreen.dart';
// import 'package:weatherapp/pages/splashScreen.dart';

import 'apiFiles/apiResponseData.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
