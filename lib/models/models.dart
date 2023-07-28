import 'dart:convert';

class ApiModel {
  final String? cityName;
  final double? temp;
  final double? wind;
  final int? pressure;
  final int? humidity;
  final double? feels_like;

  ApiModel({ this.cityName,  this.temp,  this.wind,  this.pressure,  this.humidity,  this.feels_like});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      cityName: json["name"],
      temp: json["temp"],
      wind: json["wind"]["speed"],
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
      feels_like: json["main"]["feels_like"],
    );
  }
}
