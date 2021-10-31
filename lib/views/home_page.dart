import 'dart:convert';

import 'package:flutter_weather_info/components/weather_table_title.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_info/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_info/components/app_error.dart';
import 'package:flutter_weather_info/components/app_loading.dart';
import 'package:flutter_weather_info/components/search_text_field.dart';
import 'package:flutter_weather_info/components/weather_table_cell.dart';
import 'package:flutter_weather_info/utils/constants.dart';
import 'package:flutter_weather_info/utils/navigation_utils.dart';
import 'package:flutter_weather_info/view_models/weathers_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String query = '';
  List<Weather?>? weathers = [];
  final _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WeathersViewModel weathersViewModel = context.watch<WeathersViewModel>();
    weathers = weathersViewModel.weatherListModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          appName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            searchBar(weathersViewModel),
            weatherTableTitle(),
            weatherTable(weathersViewModel),
          ],
        ),
      ),
    );
  }

  Widget weatherTableTitle() {
    return WeatherTableTitle();
  }

  Widget weatherTable(WeathersViewModel weathersViewModel) {
    if (weathersViewModel.loading) {
      return AppLoading();
    }
    if (weathersViewModel.weatherError != null) {
      return AppError(
        errortxt: weathersViewModel.weatherError!.message,
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          Weather weather = weathers![index]!;
          return WeatherTableCell(
            weather: weather,
            onTap: () async {
              weathersViewModel.setSelectedWeather(weather);
              openWeatherDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: weathersViewModel.weatherListModel!.length,
      ),
    );
  }

  Widget searchBar(WeathersViewModel weathersViewModel) {
    return Column(
      children: <Widget>[
        SearchTextField(
          cityTextController: _cityTextController,
          text: query,
          hintText: cityNameLabel,
        ),
        ElevatedButton(
          child: Text(searchButtonLabel),
          onPressed: () async {
            searchWeather(_cityTextController.text);
          },
        ),
      ],
    );
  }

  Future<Weather?> searchWeather(String city) async {
    final queryParameters = {'q': '$city', 'appid': API_KEY, 'units': 'metric'};
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final result = Weather.fromJson(json);

    setState(() {
      weathers!.add(result);
    });
  }
}
