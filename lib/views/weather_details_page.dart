import 'package:flutter/material.dart';
import 'package:flutter_weather_info/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_weather_info/view_models/weathers_view_model.dart';

class WeatherDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeathersViewModel weathersViewModel = context.watch<WeathersViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          weathersViewModel.selectedWeather!.name!,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '${weathersViewModel.selectedWeather!.main!.temp}°',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    weathersViewModel
                        .selectedWeather!.weather!.first.description!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text("Wind Speed"),
                      trailing: Text(
                        weathersViewModel.selectedWeather!.wind!.speed
                                .toString() +
                            windSpeedUnitLabel,
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloudRain),
                      title: Text("Humidity"),
                      trailing: Text(
                        weathersViewModel.selectedWeather!.main!.humidity
                                .toString() +
                            percentageLabel,
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text("Pressue"),
                      trailing: Text(
                        weathersViewModel.selectedWeather!.main!.pressure
                                .toString() +
                            pressureLabel,
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: Text("Feels like"),
                      trailing: Text(
                          '${weathersViewModel.selectedWeather!.main!.feelsLike}°'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
