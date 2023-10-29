import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic imageIcon(String weather) {
  DateTime now = DateTime.now();

  int currentHour = now.hour;
  int dayStartHour = 6;
  int nightStartHour = 18;

  String imagePath;
  IconData dynamicIcons;

  if (currentHour >= dayStartHour && currentHour < nightStartHour) {
    switch (weather) {
      case 'Clear':
        {
          imagePath = 'assets/images/sun.png';
          dynamicIcons = Icons.sunny;
        }
        break;
      case 'Clouds':
        {
          imagePath = 'assets/animations/clouds_day.json';
          dynamicIcons = CupertinoIcons.cloud_fill;
        }
        break;
      case 'Rain':
        {
          imagePath = 'assets/animations/day_rain.json';
          dynamicIcons = CupertinoIcons.cloud_rain_fill;
        }
        break;
      case 'Snow':
        {
          imagePath = 'assets/images/snowfall.png';
          dynamicIcons = CupertinoIcons.cloud_snow_fill;
        }
        break;
      case 'Drizzle':
        {
          imagePath = 'assets/animations/day_rain.json';
          dynamicIcons = CupertinoIcons.cloud_drizzle_fill;
        }
        break;
      case 'Thunderstorm':
        {
          imagePath = 'assets/animations/thunderstorm.json';
          dynamicIcons = CupertinoIcons.cloud_bolt_rain_fill;
        }
        break;
      case 'Fog':
        {
          imagePath = 'assets/animations/fog.json';
          dynamicIcons = CupertinoIcons.cloud_fog_fill;
        }
        break;
      case 'Mist':
        {
          imagePath = 'assets/animations/fog.json';
          dynamicIcons = CupertinoIcons.cloud_sleet_fill;
        }
        break;
      case 'Haze':
        {
          imagePath = 'assets/animations/haze.json';
          dynamicIcons = CupertinoIcons.cloud_fog;
        }
        break;
      default:
        {
          imagePath = 'assets/images/sun.png';
          dynamicIcons = Icons.sunny;
        }
    }
  } else {
    switch (weather) {
      case 'Clear':
        {
          imagePath = 'assets/animations/clear_night.json';
          dynamicIcons = CupertinoIcons.moon_fill;
        }
        break;
      case 'Clouds':
        {
          imagePath = 'assets/animations/clouds_night.json';
          dynamicIcons = CupertinoIcons.cloud_moon_fill;
        }
        break;
      case 'Rain':
        {
          imagePath = 'assets/animations/night_rain.json';
          dynamicIcons = CupertinoIcons.cloud_heavyrain_fill;
        }
        break;
      case 'Snow':
        {
          imagePath = 'assets/animations/snow.json';
          dynamicIcons = CupertinoIcons.cloud_snow_fill;
        }
        break;
      case 'Drizzle':
        {
          imagePath = 'assets/animations/night_rain.json';
          dynamicIcons = CupertinoIcons.cloud_drizzle_fill;
        }
        break;
      case 'Thunderstorm':
        {
          imagePath = 'assets/animations/thunderstorm.json';
          dynamicIcons = CupertinoIcons.cloud_moon_bolt_fill;
        }
        break;
      case 'Fog':
        {
          imagePath = 'assets/animations/night_fog.json';
          dynamicIcons = CupertinoIcons.cloud_fog_fill;
        }
        break;
      case 'Mist':
        {
          imagePath = 'assets/animations/clear_night.json';
          dynamicIcons = CupertinoIcons.cloud_sleet_fill;
        }
        break;
      case 'Haze':
        {
          imagePath = 'assets/animations/clear_night.json';
          dynamicIcons = CupertinoIcons.cloud_fog;
        }
        break;
      default:
        {
          imagePath = 'assets/animations/clear_night.json';
          dynamicIcons = CupertinoIcons.moon_stars_fill;
        }
    }
  }

  return {'imagePath': imagePath, 'dynamicIcons': dynamicIcons};
}
