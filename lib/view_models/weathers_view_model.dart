import 'package:flutter/material.dart';
import 'package:flutter_weather_info/model/weather.dart';
import 'package:flutter_weather_info/model/weather_error.dart';
import 'package:flutter_weather_info/repo/api_status.dart';
import 'package:flutter_weather_info/repo/weather_repository.dart';

class WeathersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Weather?>? _weatherListModel = [];
  WeatherError? _weatherError;
  Weather? _selectedWeather;

  bool get loading => _loading;
  List<Weather?>? get weatherListModel => _weatherListModel;
  WeatherError? get weatherError => _weatherError;
  Weather? get selectedWeather => _selectedWeather;

  WeathersViewModel() {
    getWeathers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setWeatherListModel(List<Weather> weatherListModel) {
    _weatherListModel = weatherListModel;
  }

  setWeatherError(WeatherError weatherError) {
    _weatherError = weatherError;
  }

  setSelectedWeather(Weather weather) {
    _selectedWeather = weather;
  }

  getWeathers() async {
    setLoading(true);

    var response = await WeatherRepository.getWeathers();

    if (response is Success) {
      setWeatherListModel(response.response as List<Weather>);
    }
    if (response is Failure) {
      WeatherError weatherError = WeatherError(
        code: response.code,
        message: response.errorResponse,
      );
      setWeatherError(weatherError);
    }
    setLoading(false);
  }
}
