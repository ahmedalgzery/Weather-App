// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/service/weather_service.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();
                WeatherModel weatherModel =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false).cityName=cityName;
                     Provider.of<WeatherProvider>(context, listen: false) .weatherModel = weatherModel;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Search'),
                hintText: 'Enter City Name',
                suffixIcon: Icon(Icons.search_rounded),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 24.0,
                ),
              ),
            ),
          ),
        ));
  }
}
