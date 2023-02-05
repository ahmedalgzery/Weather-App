// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screen/search_screen.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  WeatherModel? weather;

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    weather = Provider.of<WeatherProvider>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: weather == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weather!.getThemeColor(),
                    weather!.getThemeColor()[300]!,
                    weather!.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Updated at : ${weather!.date.hour.toString()}:${weather!.date.minute.toString()}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        weather!.weatherIcon,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('images/cloudy.png');
                        },
                      ),
                      Text(
                        '${weather!.avgTemp.toInt()}',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'max ${weather!.maxTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'min  ${weather!.minTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weather!.weatherStat,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
