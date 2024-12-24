import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/blocs/location/location_service_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_ink_well_widget.dart';
import 'package:weather/features/common/presentation/ui/widgets/location_permission_popup.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/presentation/blocs/weather/weather_forecast_cubit.dart';

class WeatherAndUserLocationWidget extends StatelessWidget {
  const WeatherAndUserLocationWidget({
    required this.data,
    super.key,
  });

  final WeatherModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data.location?.name ?? 'No data',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 42, fontWeight: FontWeight.w600),
        ),
        const Gap(8),
        AppInkWellWidget(
          onTap: () => _getCurrentLocationAndUpdateWeather(context),
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: BlocBuilder<LocationServiceCubit, LocationServiceState>(
              builder: (context, state) {
                if (state.isLoading == true) {
                  return Shimmer(child: const Row());
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: white,
                      size: 16,
                    ),
                    const Gap(8),
                    Text(
                      'Current Location',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getCurrentLocationAndUpdateWeather(BuildContext context) async {
    final locationServiceCubit = context.read<LocationServiceCubit>();

    await locationServiceCubit.requestLocationPermission();

    if (locationServiceCubit.state.hasPermission &&
        locationServiceCubit.state.position != null) {
      final position = locationServiceCubit.state.position!;
      if (context.mounted) {
        await context.read<WeatherForecastCubit>().getWeatherForeCast(
              lat: position.latitude,
              long: position.longitude,
            );
      }
    } else {
      if (context.mounted) {
        showPermissionDeniedDialog(context);
      }
    }
  }
}
