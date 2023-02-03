import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/screen/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
     create: (context) {
        return WeatherProvider();
      },
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
       MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomeScreen(),
      
    );
  }
}
