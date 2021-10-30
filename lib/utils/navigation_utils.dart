import 'package:flutter/material.dart';
import 'package:flutter_weather_info/views/weather_details_page.dart';

void openWeatherDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WeatherDetailPage(),
    ),
  );
}
