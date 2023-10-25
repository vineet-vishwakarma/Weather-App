import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatefulWidget {
  final String humidity;
  final String windSpeed;
  final String pressure;
  const AdditionalInfo(
      {super.key,
      required this.humidity,
      required this.windSpeed,
      required this.pressure});

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Card(
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
            const Text(
              'Humidity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${widget.humidity}%',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            const Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.wind,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                )),
            const Text(
              'Wind Speed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${widget.windSpeed} km/h',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            const Card(
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
            const Text(
              'Pressure',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${widget.pressure} mBar',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
