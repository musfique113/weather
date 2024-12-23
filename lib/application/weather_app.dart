import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/service_locator.dart';
import 'package:weather/application/theme_data/global_theme_data.dart';
import 'package:weather/features/common/presentation/ui/screens/splash_screen.dart';
import 'package:weather/features/weather/presentation/blocs/weather/weather_forecast_cubit.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastCubit(sl()),
      child: MaterialApp(
        title: 'Weather',
        theme: GlobalThemeData.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
