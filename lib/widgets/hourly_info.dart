import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HourlyInfo extends StatefulWidget {
  final String temp;
  final String time;
  final String img;
  final IconData icon;
  const HourlyInfo(
      {super.key,
      required this.temp,
      required this.time,
      required this.icon,
      required this.img});

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
        height: 130,
        width: 70,
        child: Card(
          color: isHovered
              ? const Color.fromARGB(255, 129, 110, 248)
              : Colors.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
              bottom: Radius.circular(40),
            ),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isHovered = !isHovered;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isHovered
                      ? Text(
                          widget.time,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        )
                      : Text(
                          widget.time,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                  isHovered
                      ? Lottie.asset(
                          widget.img,
                          width: 60,
                        )
                      : Icon(
                          widget.icon,
                          size: 40,
                          color: isHovered ? Colors.white : Colors.black,
                        ),
                  isHovered
                      ? Text(
                          '${widget.temp}\u00B0',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          '${widget.temp}\u00B0',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
