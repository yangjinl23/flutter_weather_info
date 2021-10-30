import 'dart:convert';

WeatherError weatherErrorFromJson(String str) =>
    WeatherError.fromJson(json.decode(str));

String weatherErrorToJson(WeatherError data) => json.encode(data.toJson());

class WeatherError {
  WeatherError({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory WeatherError.fromJson(Map<String, dynamic> json) => WeatherError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
