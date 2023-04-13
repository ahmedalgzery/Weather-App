// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screen/initial_screen.dart';
import 'package:weather/screen/search_screen.dart';
import 'package:weather/screen/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  WeatherModel? weather;

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadinState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccessState) {
          weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return WeatherScreen(weather: weather);
        } else if (state is WeatherFailureaState) {
          return const Center(
            child: Text(
              'Something wentwrong try again',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return const InitialScreen();
        }
      }),
    );
  }
}
