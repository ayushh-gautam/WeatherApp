// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/allWidgets.dart';
import '../Modules/constants.dart';
import 'welcome.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.cloud,
              size: 200.0,
              color: Colors.white,
            ),
            Text(
              'Weather News \n & Feed',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \n sed do eiusmod tempor incididunt ut labore et \n dolore magna aliqua.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return WelcomePage();
                }));
              },
              child: GetStartedButton(),
            )
          ],
        ),
      ),
    );
  }
}

