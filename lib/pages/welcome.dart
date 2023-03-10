// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, override_on_non_overriding_member, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/apiFiles/apiResponseData.dart';
import 'package:weatherapp/apiFiles/weatherApiClient.dart';
import 'package:weatherapp/pages/userLocation.dart';
import 'package:weatherapp/widgets/sunrise&set.dart';
import '../Modules/constants.dart';
import '../widgets/allWidgets.dart';
import 'package:intl/intl.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var latitude;
  var longitude;
  WeatherClient client = WeatherClient();

  Future<WeatherData?>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _getCurrentWeatherData();
  }

  Future<WeatherData?> _getCurrentWeatherData() async {
    UserLocation currentLocation = UserLocation();
    await currentLocation.getLocation();
    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    return await client.getApiData(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWelcomePage,
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ),
            // Card
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
                          FutureBuilder<WeatherData?>(
                            future: _futureData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                  '${snapshot.data?.temperature}°C',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
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
                          '${snapshot.data?.city}',
                          style: TextStyle(color: Colors.white, fontSize: 19),
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
              ),
            ),
            SizedBox(
              height: 28,
            ),

            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SunRiseSet(futureData: _futureData),
                SizedBox(
                  width: 40,
                ),
                SunSet(futureData: _futureData),

                SizedBox(
                  height: 25,
                ),
                //Weather Forecast

                //Chart

                // ignore: prefer_const_constructors
              ]),
            ),
          ]),
        ));
  }
}
