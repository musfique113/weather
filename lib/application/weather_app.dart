import 'package:flutter/material.dart';
import 'package:weather/application/theme_data/global_theme_data.dart';
import 'package:weather/features/weather/presentation/ui/screens/home_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: GlobalThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
