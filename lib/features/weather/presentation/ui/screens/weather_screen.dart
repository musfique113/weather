import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/blocs/location/location_service_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_gradient_bg.dart';
import 'package:weather/features/common/presentation/ui/widgets/location_permission_popup.dart';
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

    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final locationServiceCubit = context.read<LocationServiceCubit>();

    await locationServiceCubit.requestLocationPermission();

    if (locationServiceCubit.state.hasPermission &&
        locationServiceCubit.state.position != null) {
      final position = locationServiceCubit.state.position!;
      if (mounted) {
        await context.read<WeatherForecastCubit>().getWeatherForeCast(
              lat: position.latitude,
              long: position.longitude,
            );
      }
    } else {
      if (mounted) {
        showPermissionDeniedDialog(context);
      }
    }
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
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
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
