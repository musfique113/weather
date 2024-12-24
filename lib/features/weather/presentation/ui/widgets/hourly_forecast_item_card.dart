import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/enums/temperature_unit.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/application/utils/data_time_formater.dart';
import 'package:weather/features/common/presentation/blocs/temp_unit/temperature_unit_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/reusable_cached_image.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class HourlyForecastItemCard extends StatelessWidget {
  const HourlyForecastItemCard({
    required this.hourlyForecast,
    super.key,
  });

  final Hour hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              Text(
                DateTimeFormater.formatDateTime(
                  hourlyForecast.timeEpoch!.toInt(),
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(8),
              _buildIconSection(),
              const Gap(8),
              BlocBuilder<TemperatureUnitCubit, TemperatureUnit>(
                builder: (context, state) {
                  return Text(
                    state == TemperatureUnit.celsius
                        ? '${hourlyForecast.tempC ?? 0}°'
                        : '${hourlyForecast.tempF ?? 0}°',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconSection() {
    return SizedBox(
      height: 48,
      width: 48,
      child: ReusableCachedImage(
        boxFit: BoxFit.cover,
        isFullPath: true,
        imagePath: 'https:${hourlyForecast.condition?.icon ?? ''}',
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          white.withOpacity(0.4),
          white.withOpacity(0.15),
        ],
      ),
      border: Border.all(color: darkGray),
      borderRadius: BorderRadius.circular(48),
    );
  }
}
