import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/newApi.dart';

class WeatherBloc extends Cubit<ApiModel> {
  WeatherBloc()
      : super(
    ApiModel(
      weather: [],
      main: Main(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0),
      wind: Wind(speed: 0, deg: 0),
      name: '',
    ),
  );

  Future<void> getCurrentWeather(String location) async {
    try {
      var url = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=12898321d500aae37a500581193ef4da&unit=metric";
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        final data = ApiModel.fromJson(decodeData);
        emit(data);
      } else {
        emit(WeatherError("Something went wrong. Error code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(WeatherError("An error occurred: $e"));
    }
  }
}

