import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/presentation/ui/widgets/hourly_forecast_widget.dart';
import 'package:weather/features/weather/presentation/ui/widgets/temperature_unit_toggle_switch.dart';
import 'package:weather/features/weather/presentation/ui/widgets/weather_and_user_location_widget.dart';
import 'package:weather/features/weather/presentation/ui/widgets/weather_info_widget.dart';

class WeatherScreenContent extends StatelessWidget {
  const WeatherScreenContent({
    required this.data,
    super.key,
  });

  final WeatherModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(49),
        WeatherAndUserLocationWidget(data: data),
        WeatherInfoWidget(
          data: data,
          day: 1,
        ),
        const Gap(12),
        const TemperatureUnitToggleSwitch(),
        const Gap(12),
        HourlyForecastWidget(
          data: data,
          day: 1,
        ),
      ],
    );
  }
}
