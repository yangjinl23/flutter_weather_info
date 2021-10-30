import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_info/utils/constants.dart';
import 'package:flutter_weather_info/view_models/weathers_view_model.dart';
import 'package:flutter_weather_info/views/home_page.dart';

void main() {
  runApp(WeatherInfo());
}

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeathersViewModel()),
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
