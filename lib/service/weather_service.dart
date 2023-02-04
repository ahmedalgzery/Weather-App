// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  WeatherModel? weather;
 
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '3ba7ced439d849a3952193627230202';
  Future<WeatherModel?> getWeather({required String cityName}) async {
     try{
    var url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weather = WeatherModel.fromJson(data);
  }
  catch (error){
    print(error);
  }
  return weather;
  
  }
  
    
}
