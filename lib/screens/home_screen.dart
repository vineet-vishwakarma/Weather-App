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
                  'https://clipart-library.com/new_gallery/map-clipart-30.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200,
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
                      child: const Row(
                        children: [],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -100,
                  child: Image.network(
                    'https://cdn3d.iconscout.com/3d/premium/thumb/rain-3311753-2754887.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
