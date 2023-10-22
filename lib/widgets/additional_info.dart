import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.drop,
                  color: Colors.blueAccent,
                  size: 40,
                ),
              ),
            ),
            Text(
              'Humidity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '70%',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.wind,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                )),
            Text(
              'Wind Speed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '7.5 km/h',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.umbrella,
                  size: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Text(
              'Pressure',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '1000',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

