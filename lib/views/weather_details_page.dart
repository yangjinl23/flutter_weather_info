import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_info/components/app_title.dart';
import 'package:flutter_weather_info/view_models/weathers_view_model.dart';

class WeatherDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeathersViewModel weathersViewModel = context.watch<WeathersViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text(weathersViewModel.selectedWeather!.name! + ' Weather Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTitle(text: weathersViewModel.selectedWeather!.name!),
            SizedBox(height: 5.0),
            Text(
              weathersViewModel.selectedWeather!.weather!.first.description!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              weathersViewModel.selectedWeather!.main!.tempMin.toString(),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              weathersViewModel.selectedWeather!.main!.tempMax.toString(),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              weathersViewModel.selectedWeather!.main!.humidity.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              weathersViewModel.selectedWeather!.main!.temp.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
