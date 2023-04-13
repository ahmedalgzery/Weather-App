import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
    required this.weather,
  });

  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            BlocProvider.of<WeatherCubit>(context).cityName!,
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
    );
  }
}
