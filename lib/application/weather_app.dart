import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/service_locator.dart';
import 'package:weather/application/theme_data/global_theme_data.dart';
import 'package:weather/features/common/presentation/blocs/location/location_service_cubit.dart';
import 'package:weather/features/common/presentation/blocs/temp_unit/temperature_unit_cubit.dart';
import 'package:weather/features/common/presentation/ui/screens/splash_screen.dart';
import 'package:weather/features/weather/presentation/blocs/selected_day/selected_day_weather_cubit.dart';
import 'package:weather/features/weather/presentation/blocs/weather/weather_forecast_cubit.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherForecastCubit(sl()),
        ),
        BlocProvider(
          create: (_) => LocationServiceCubit(sl()),
        ),
        BlocProvider(create: (_) => TemperatureUnitCubit()),
        BlocProvider(create: (_) => SelectedDayWeatherCubit()),
      ],
      child: MaterialApp(
        title: 'Weather',
        theme: GlobalThemeData.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
