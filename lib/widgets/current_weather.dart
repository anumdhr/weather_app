import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
    required this.temp,
    required this.location,
  });

  final String temp;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(
            temp,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            location,
            style: const TextStyle(color: Colors.black38, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
