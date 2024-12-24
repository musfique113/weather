import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/presentation/blocs/selected_day/selected_day_weather_cubit.dart';
import 'package:weather/features/weather/presentation/ui/widgets/day_selection_widget.dart';
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
        BlocBuilder<SelectedDayWeatherCubit, int>(
          builder: (context, state) {
            return WeatherInfoWidget(
              data: data,
              day: state,
            );
          },
        ),
        const Gap(12),
        const TemperatureUnitToggleSwitch(),
        const Gap(12),
        const DaySelectionWidget(),
        const Gap(12),
        BlocBuilder<SelectedDayWeatherCubit, int>(
          builder: (context, state) {
            return HourlyForecastWidget(
              data: data,
              day: state,
            );
          },
        ),
      ],
    );
  }
}
