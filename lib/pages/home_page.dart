import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/newApi.dart';

import '../bloc/bloc_service.dart';
import '../widgets/additional_info.dart';
import '../widgets/current_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    await context.read<WeatherBloc>().getCurrentWeather("Kathmandu");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.menu_sharp,
                color: Colors.black,
              )),
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.brown,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.brown,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.brown,
                            )),
                        hintText: 'Search City'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<WeatherBloc>().getCurrentWeather(controller.text.trim());
                  },
                  child: const Text('Search',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocBuilder<WeatherBloc, ApiModel>(
              builder: (context, apiState) {
                if (apiState.weather!.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CurrentWeather(
                        icon: Icon(
                          Icons.wb_sunny_sharp,
                          color: Colors.yellow.shade800,
                          size: 50,
                        ),
                        temp: "${kelvinToCelsius(apiState.main!.feelsLike).toStringAsFixed(2)}°",
                        location: controller.text.trim().isEmpty ? 'Kathmandu' : controller.text.trim(),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Additional Information",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Text('${kelvinToCelsius(apiState.main!.feelsLike)} °'),
                      const SizedBox(height: 30),
                      AdditionalInformation(
                        wind: "${apiState.wind!.speed} km/s",
                        pressure: "${apiState.main!.pressure} mmHg",
                        humidity: "${apiState.main!.humidity} %",
                        feels_like: "${kelvinToCelsius(apiState.main!.feelsLike).toStringAsFixed(2)}°",
                        // feels_like: "${apiState.main!.feelsLike} °",
                      ),
                    ],
                  );
                } else {
                  return const Expanded(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Search city to get the data'),
                      ],
                    )),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


