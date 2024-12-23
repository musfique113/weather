import 'package:flutter/material.dart';
import 'package:weather/application/service_locator.dart';
import 'package:weather/application/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const WeatherApp());
}
