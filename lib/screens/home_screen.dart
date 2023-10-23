import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_info.dart';
import 'package:weather_app/widgets/hourly_info.dart';
import 'package:weather_app/widgets/main_weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = 'Bhopal';
  String date = '21 Oct';
  late String query;
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
      body: Padding(
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
                        city,
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
                  SearchBar(
                    onSubmitted: (value) {
                      print(value);
                      query = value;
                    },
                    textStyle: const MaterialStatePropertyAll(
                        TextStyle(fontStyle: FontStyle.italic)),
                    hintText: 'Any City',
                    hintStyle: const MaterialStatePropertyAll(
                        TextStyle(fontStyle: FontStyle.italic)),
                    elevation: const MaterialStatePropertyAll(2),
                    trailing: [
                      IconButton(
                        onPressed: () {
                          print(query);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 129, 110, 248),
                        ),
                      )
                    ],
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                      minHeight: 35,
                      maxHeight: 35,
                    ),
                  ),
                ],
              ),
              const MainCard(),
              const SizedBox(
                height: 10,
              ),
              const AdditionalInfo(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
              const SizedBox(
                height: 10,
              ),
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
                      temp: '30',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
