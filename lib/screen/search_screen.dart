// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubit/weather_cubit/weather_cubit.dart';
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
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Search'),
                hintText: 'Enter City Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weatherModel =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherModel = weatherModel;
                    Navigator.pop(context);
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 24.0,
                ),
              ),
            ),
          ),
        ));
  }
}
