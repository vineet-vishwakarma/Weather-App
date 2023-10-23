import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/config.dart';
import 'package:weather_app/widgets/additional_info.dart';
import 'package:weather_app/widgets/hourly_info.dart';
import 'package:weather_app/widgets/main_weather_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = 'Bhopal';
  String date = DateFormat("EEE dd").format(DateTime.now());
  late double currentTemp;
  late double feelsLikeTemp;
  late String description;
  late String imgLocation;

  Future getCurrentWeather() async {
    try {
      final result = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apiKey&units=metric'),
      );
      final data = jsonDecode(result.body);

      if (data['cod'] != '200') {
        throw data['message'];
      }
      currentTemp = data['list'][0]['main']['temp'];
      feelsLikeTemp = data['list'][0]['main']['feels_like'];
      String weatherDescription = data['list'][0]['weather'][0]['description'];
      description = weatherDescription[0].toUpperCase() +
          weatherDescription.substring(1, weatherDescription.length);
      String weather = data['list'][0]['weather'][0]['main'];
      weather == 'Clouds'
          ? imgLocation = 'assets/images/clouds.png'
          : imgLocation = 'assets/images/sun.png';
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$city📍',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            date,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      // Image.network(
                      //   'https://cdn.pixabay.com/photo/2016/03/22/04/23/map-1272165_1280.png',
                      //   width: 100,
                      //   height: 100,
                      // ),
                      Expanded(
                        child: SearchBar(
                          onSubmitted: (value) {
                            setState(() {
                              if (value != '') city = value;
                            });
                          },
                          textStyle: const MaterialStatePropertyAll(
                            TextStyle(fontStyle: FontStyle.italic),
                          ),
                          hintText: 'Any City',
                          hintStyle: const MaterialStatePropertyAll(
                            TextStyle(fontStyle: FontStyle.italic),
                          ),
                          elevation: const MaterialStatePropertyAll(2),
                          trailing: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 129, 110, 248),
                              ),
                            )
                          ],
                          constraints: const BoxConstraints(
                            maxWidth: 10,
                            minHeight: 35,
                            maxHeight: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MainCard(
                    imgLocation: imgLocation,
                    temp: currentTemp.toString(),
                    feelsLike: feelsLikeTemp.toString(),
                    description: description,
                  ),
                  const SizedBox(height: 10),
                  const AdditionalInfo(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text(
                              'Next 7 Days',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HourlyInfo(
                          time: '12:00',
                          icon: CupertinoIcons.cloud_bolt_fill,
                          temp: '30',
                        ),
                        HourlyInfo(
                          time: '2:00',
                          icon: CupertinoIcons.cloud_bolt_rain_fill,
                          temp: '28',
                        ),
                        HourlyInfo(
                          time: '4:00',
                          icon: CupertinoIcons.cloud_bolt_rain_fill,
                          temp: '28',
                        ),
                        HourlyInfo(
                          time: '6:00',
                          icon: CupertinoIcons.cloud_hail_fill,
                          temp: '22',
                        ),
                        HourlyInfo(
                          time: '8:00',
                          icon: CupertinoIcons.cloud_rain_fill,
                          temp: '26',
                        ),
                        HourlyInfo(
                            time: '10:00',
                            icon: CupertinoIcons.cloud_moon_bolt_fill,
                            temp: '30'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
