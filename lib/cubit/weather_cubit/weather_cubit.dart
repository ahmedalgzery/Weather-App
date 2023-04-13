import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherIntialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadinState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureaState());
    }
  }
}
