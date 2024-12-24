import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/enums/temperature_unit.dart';
import 'package:weather/features/common/presentation/blocs/temp_unit/temperature_unit_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/reusable_cached_image.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class WeatherInfoWidget extends StatefulWidget {
  const WeatherInfoWidget({
    required this.day,
    required this.data,
    super.key,
  });

  final int day;

  final WeatherModel data;

  @override
  State<WeatherInfoWidget> createState() => _WeatherInfoWidgetState();
}

class _WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildWeatherIcon(),
                const Gap(24),
                _buildTemperature(),
              ],
            ),
          ),
        ),
        _buildWeatherSummary(),
      ],
    );
  }

  Widget _buildWeatherSummary() {
    return BlocBuilder<TemperatureUnitCubit, TemperatureUnit>(
      builder: (context, state) {
        return Text(
          widget.day == 0
              ? state == TemperatureUnit.celsius
                  ? '${widget.data.current?.condition?.text ?? ''}  -  H:${widget.data.current?.heatindexC ?? 0}°  L: ${widget.data.current?.feelslikeC ?? 0}°'
                  : '${widget.data.current?.condition?.text ?? ''}  -  H:${widget.data.current?.heatindexF ?? 0}°  L: ${widget.data.current?.feelslikeF ?? 0}°'
              : state == TemperatureUnit.celsius
                  ? '${widget.data.forecast!.forecastday?[widget.day].day?.condition?.text ?? ''}  -  H:${widget.data.forecast!.forecastday?[widget.day].day?.maxtempC ?? 0}°  L: ${widget.data.forecast!.forecastday?[widget.day].day?.avgtempC ?? 0}°'
                  : '${widget.data.forecast!.forecastday?[widget.day].day?.condition?.text ?? ''}  -  H:${widget.data.forecast!.forecastday?[widget.day].day?.maxtempF ?? 0}°  L: ${widget.data.forecast!.forecastday?[widget.day].day?.avgtempF ?? 0}°',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        );
      },
    );
  }

  Widget _buildTemperature() {
    return BlocBuilder<TemperatureUnitCubit, TemperatureUnit>(
      builder: (context, state) {
        return Text(
          widget.day == 0
              ? state == TemperatureUnit.celsius
                  ? '${widget.data.current?.tempC ?? 0}°'
                  : '${widget.data.current?.tempF ?? 0}°'
              : state == TemperatureUnit.celsius
                  ? '${widget.data.forecast!.forecastday?[widget.day].day?.avgtempC ?? 0}°'
                  : '${widget.data.forecast!.forecastday?[widget.day].day?.avgtempF ?? 0}°',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 90, fontWeight: FontWeight.w500),
        );
      },
    );
  }

  Widget _buildWeatherIcon() {
    return SizedBox(
      height: 130,
      width: 135,
      child: ReusableCachedImage(
        boxFit: BoxFit.cover,
        isFullPath: true,
        imagePath: widget.day == 0
            ? 'https:${widget.data.current?.condition?.icon}'
            : 'https:${widget.data.forecast!.forecastday?[widget.day].day?.condition?.icon}',
      ),
    );
  }
}
