import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  AdditionalInformation({
    super.key,
    required this.wind,
    required this.pressure,
    required this.humidity,
    required this.feels_like,
  });

  final String wind;
  final String pressure;
  final String humidity;
  final String feels_like;
  final maintextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final subtextStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind",
                    style: maintextStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Pressure",
                    style: maintextStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    wind,
                    style: subtextStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    pressure,
                    style: subtextStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Humidity",
                    style: maintextStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Feels Like",
                    style: maintextStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    humidity,
                    style: subtextStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    feels_like,
                    style: subtextStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
