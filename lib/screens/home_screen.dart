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
  late String weather;
  late String imgLocation;
  late int humidity;
  late dynamic windSpeed;
  late dynamic pressure;
  late String time;
  late Map dataset;

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
      weather = data['list'][0]['weather'][0]['main'];
      weather == 'Clouds'
          ? imgLocation = 'assets/images/clouds.png'
          : imgLocation = 'assets/images/sun.png';

      humidity = data['list'][0]['main']['humidity'];
      pressure = data['list'][0]['main']['pressure'];
      windSpeed = data['list'][0]['wind']['speed'];
      dataset = data;
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
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
            return CupertinoAlertDialog(
              // title: Text(snapshot.error.toString()),
              title: const Text('Server Error Occur Back To Homepage'),
              actions: [
                TextButton(
                  onPressed: () {
                    city = 'Bhopal';
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ],
            );
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
                    weatherMain: weather,
                  ),
                  const SizedBox(height: 20),
                  AdditionalInfo(
                    humidity: humidity.toString(),
                    windSpeed: windSpeed.toString(),
                    pressure: pressure.toString(),
                  ),
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
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: 35,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final time = DateTime.parse(
                            dataset['list'][index + 1]['dt_txt'].toString());
                        return HourlyInfo(
                          temp: dataset['list'][index + 1]['main']['temp']
                              .toString(),
                          time: DateFormat.Hm().format(time),
                          icon: Icons.cloud,
                        );
                      },
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
