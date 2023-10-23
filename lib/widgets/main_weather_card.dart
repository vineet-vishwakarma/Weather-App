import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 110,
                            ),
                            Text(
                              'Heavy Rain',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
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
                              'Tonight',
                              style: TextStyle(
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
                              child: const Text(
                                '27\u00B0',
                                style: TextStyle(
                                  fontSize: 72,
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
              begin: Offset(-5, 0),
              end: Offset(5, 0),
              duration: Duration(seconds: 5),
            ),
          ],
          child: Positioned(
            bottom: 95,
            left: 50,
            child: Image.asset(
              'assets/images/11.png',
              width: 120,
            ),
          ),
        ),
      ],
    );
  }
}
