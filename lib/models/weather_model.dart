import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  String weatherStat;
  String weatherIcon;
  double maxTemp;
  double minTemp;
  double avgTemp;
  WeatherModel(
      {required this.date,
      required this.weatherStat,
      required this.weatherIcon,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        weatherStat: jsonData['condition']['text'],
        weatherIcon: jsonData['condition']['icon'],
        avgTemp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
  MaterialColor getThemeColor() {
    if (weatherStat == 'Sunny' ||
        weatherStat == 'Clear' ||
        weatherStat == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStat == 'Blizzard' ||
        weatherStat == 'Patchy snow possible' ||
        weatherStat == 'Patchy sleet possible' ||
        weatherStat == 'Patchy freezing drizzle possible' ||
        weatherStat == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStat == 'Freezing fog' ||
        weatherStat == 'Fog' ||
        weatherStat == 'Heavy Cloud' ||
        weatherStat == 'Mist' ||
        weatherStat == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStat == 'Patchy rain possible' ||
        weatherStat == 'Heavy Rain' ||
        weatherStat == 'Showers' ||
        weatherStat == 'Overcast') {
      return Colors.blue;
    } else if (weatherStat == 'Thundery outbreaks possible' ||
        weatherStat == 'Moderate or heavy snow with thunder' ||
        weatherStat == 'Patchy light snow with thunder' ||
        weatherStat == 'Moderate or heavy rain with thunder' ||
        weatherStat == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return '{$date $avgTemp $weatherStat}';
  }
}
