import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/app_router/app_router.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/blocs/location/location_service_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_logo.dart';
import 'package:weather/features/common/presentation/ui/widgets/location_permission_popup.dart';
import 'package:weather/features/weather/presentation/ui/screens/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() {
    final locationCubit = context.read<LocationServiceCubit>();
    locationCubit.requestLocationPermission().then((_) {
      if (mounted) {
        final hasPermission = locationCubit.state.hasPermission;
        if (hasPermission) {
          _navigateToWeatherScreen();
        } else {
          showPermissionDeniedDialog(context);
        }
      }
    });
  }

  void _navigateToWeatherScreen() {
    AppRouter.replaceWith(context, const WeatherScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          const Spacer(),
          const AppLogo(),
          const Spacer(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: const LinearProgressIndicator(),
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
