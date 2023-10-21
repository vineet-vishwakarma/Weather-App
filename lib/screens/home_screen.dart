import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = 'Bhopal';
  String date = '21 Oct';
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
                Image.network(
                  // 'https://clipart-library.com/new_gallery/map-clipart-30.png',
                  'https://cdn.pixabay.com/photo/2016/03/22/04/23/map-1272165_1280.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
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
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20,),
                          Image.network(
                            'https://cdn3d.iconscout.com/3d/premium/thumb/rain-3311753-2754887.png',
                            width: 220,
                          ),
                          const Text(
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
                          const Text(
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
                                fontSize: 60,
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
                            color: Colors.blueAccent,
                            size: 70,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
