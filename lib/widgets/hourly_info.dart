import 'package:flutter/material.dart';

class HourlyInfo extends StatefulWidget {
  final String temp;
  final String time;
  final IconData icon;
  const HourlyInfo(
      {super.key, required this.temp, required this.time, required this.icon});

  @override
  State<HourlyInfo> createState() => _HourlyInfoState();
}

class _HourlyInfoState extends State<HourlyInfo> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 120,
        child: Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
              bottom: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(
                  widget.icon,
                  size: 40,
                ),
                Text(
                  '${widget.temp}\u00B0',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
