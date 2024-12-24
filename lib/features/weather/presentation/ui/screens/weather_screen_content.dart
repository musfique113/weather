import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/enums/temperature_unit.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
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
          weather: data,
          day: 1,
          tempUnit: TemperatureUnit.celsius,
        ),
      ],
    );
  }
}
