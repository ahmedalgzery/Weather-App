import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  String? cityName;
  WeatherModel? get weatherModel => _weatherModel;
  set weatherModel(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }
}
