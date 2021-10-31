import 'package:flutter/material.dart';
import 'package:flutter_weather_info/model/weather.dart';

class WeatherTableCell extends StatelessWidget {
  final Weather? weather;
  final VoidCallback? onTap;
  WeatherTableCell({this.weather, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather!.name!,
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            Spacer(),
            Text(
              '${weather!.main!.temp}°',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
