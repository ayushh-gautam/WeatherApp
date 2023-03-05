// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, override_on_non_overriding_member, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:weatherapp/apiFiles/showData.dart';
import 'package:weatherapp/pages/userLocation.dart';
import '../Modules/constants.dart';
import '../widgets/allWidgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

Weather myWeather = Weather();

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    userLocation();
  }
// this function calls and runs to get the current location of the dfevice   
  void userLocation() async {
    UserLocation currentLocation = UserLocation();
    await currentLocation.getLocation();
    print(currentLocation.latitude);
    print(currentLocation.longitude);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWelcomePage,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // App Bar
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  'Weather Forecast',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )

          //Card
          ,
          Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: EdgeInsets.all(18),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color(0xFF1B1D49),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${myWeather.temperature.toString()}°C',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sat, 3 Aug',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.sunny,
                          color: Colors.yellow,
                          size: 60,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Location
                Text(
                  myWeather.city.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 19),
                )
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dayText(
                kDays: 'Today',
                kColor: Colors.yellow,
              ),
              dayText(
                kDays: 'Tomorrow',
                kColor: Colors.white,
              ),
              dayText(
                kDays: 'Next 7 Days',
                kColor: Colors.white,
              ),
            ],
          ),

          SizedBox(
            height: 25,
          ),
          //Weather Forecast
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Forecast(
                  kTime: '10 AM',
                  kTemperature: '26 °C',
                ),
                Forecast(
                  kTime: '11 AM',
                  kTemperature: '28 °C',
                ),
                Forecast(
                  kTime: '12 AM',
                  kTemperature: '30 °C',
                ),
                Forecast(
                  kTime: '1 PM',
                  kTemperature: '34 °C',
                ),
              ],
            ),
          ),

          //Chart

          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 14.0),
            child: Text(
              'Chance of rain',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ]),
      ),
    );
  }
}
