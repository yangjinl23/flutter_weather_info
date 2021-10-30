import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_weather_info/model/weather.dart';
import 'package:flutter_weather_info/repo/api_status.dart';
import 'package:flutter_weather_info/utils/constants.dart';

class WeatherRepository {
  static Future<Object?> getWeathers() async {
    try {
      var response = await http.get(Uri.parse(weatherList));

      if (SUCCESS == response.statusCode) {
        return Success(response: dataFromJson(response.body).list);
      }
      return Failure(
          code: WEATHER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
