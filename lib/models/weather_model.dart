class WeatherModel {
  String date;
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
        date: data['location']['localtime'],
        weatherStat: jsonData['condition']['text'],
        weatherIcon: jsonData['condition']['icon'],
        avgTemp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
  @override
  String toString() {
    return '{$date $avgTemp $weatherStat}';
  }
}
