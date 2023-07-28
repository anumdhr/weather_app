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

  Future getCurrentWeather(String location) async {
    print(1);
    var url = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=12898321d500aae37a500581193ef4da&unit =metrices";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    print(2);

    final decodeData = jsonDecode(body) ;
    print(decodeData);
    final data = ApiModel.fromJson(decodeData);
    print(data);
    emit(data);

  }
}
