import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_gradient_bg.dart';
import 'package:weather/features/weather/presentation/blocs/weather/weather_forecast_cubit.dart';
import 'package:weather/features/weather/presentation/ui/screens/weather_screen_content.dart';
import 'package:weather/features/weather/presentation/ui/widgets/weather_screen_shimmer.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherForecastCubit>().getWeatherForeCast(location: 'London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: AppGradientBG(
        child: BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
          builder: (context, state) {
            if (state is WeatherForecastInLoading) {
              return const WeatherScreenShimmer();
            }
            if (state is WeatherForecastLoadSuccess) {
              return WeatherScreenContent(data: state.data);
            }
            if (state is WeatherForecastLoadFailure) {
              return Text(
                state.message,
                style: const TextStyle(color: crimson),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
