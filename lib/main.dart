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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
         primarySwatch: Provider.of<WeatherProvider>(context).weatherModel == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherModel!.getThemeColor()  ,
        ),
        home: HomeScreen(),
      
    );
  }
}
