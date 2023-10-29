import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class MainCard extends StatelessWidget {
  final String temp;
  final String feelsLike;
  final String description;
  final String weatherMain;
  final String imgLocation;
  const MainCard(
      {super.key,
      required this.temp,
      required this.feelsLike,
      required this.description,
      required this.imgLocation,
      required this.weatherMain});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(
          duration: Duration(milliseconds: 900),
        ),
      ],
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              height: 220,
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                    left: Radius.circular(50),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 174, 205, 255),
                        Color.fromARGB(255, 88, 151, 253),
                      ],
                    ),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50),
                      left: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 120,
                              ),
                              Text(
                                weatherMain,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(50, 3, 168, 244),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(50, 3, 168, 244),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color.fromARGB(255, 159, 196, 255),
                                      ]).createShader(bounds);
                                },
                                child: Text(
                                  '$temp\u00B0',
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(50, 3, 168, 244),
                                        offset: Offset(0, 5),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Feels like $feelsLike\u00B0',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(50, 3, 168, 244),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.waves,
                                color: Color.fromARGB(53, 68, 137, 255),
                                size: 70,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Animate(
            onPlay: (controller) => controller.repeat(reverse: true),
            effects: const [
              MoveEffect(
                begin: Offset(-20, 0),
                end: Offset(5, 0),
                duration: Duration(seconds: 5),
              ),
            ],
            child: Positioned(
              bottom: 95,
              left: 50,
              child: Lottie.asset(
                imgLocation,
                width: 140,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
