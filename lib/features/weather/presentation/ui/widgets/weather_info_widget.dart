import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/enums/temperature_unit.dart';
import 'package:weather/features/common/presentation/ui/widgets/reusable_cached_image.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class WeatherInfoWidget extends StatefulWidget {
  const WeatherInfoWidget({
    required this.day,
    required this.tempUnit,
    required this.weather,
    super.key,
  });

  final int day;
  final TemperatureUnit tempUnit;
  final WeatherModel weather;

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
    return Text(
      widget.day == 0
          ? widget.tempUnit == TemperatureUnit.celsius
              ? '${widget.weather.current?.condition?.text ?? ''}  -  H:${widget.weather.current?.heatindexC ?? 0}°  FL: ${widget.weather.current?.feelslikeC ?? 0}°'
              : '${widget.weather.current?.condition?.text ?? ''}  -  H:${widget.weather.current?.heatindexF ?? 0}°  FL: ${widget.weather.current?.feelslikeF ?? 0}°'
          : widget.tempUnit == TemperatureUnit.celsius
              ? '${widget.weather.forecast!.forecastday?[widget.day].day?.condition?.text ?? ''}  -  H:${widget.weather.forecast!.forecastday?[widget.day].day?.maxtempC ?? 0}°  FL: ${widget.weather.forecast!.forecastday?[widget.day].day?.avgtempC ?? 0}°'
              : '${widget.weather.forecast!.forecastday?[widget.day].day?.condition?.text ?? ''}  -  H:${widget.weather.forecast!.forecastday?[widget.day].day?.maxtempF ?? 0}°  FL: ${widget.weather.forecast!.forecastday?[widget.day].day?.avgtempF ?? 0}°',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget _buildTemperature() {
    return Text(
      widget.day == 0
          ? widget.tempUnit == TemperatureUnit.celsius
              ? '${widget.weather.current?.tempC ?? 0}°'
              : '${widget.weather.current?.tempF ?? 0}°'
          : widget.tempUnit == TemperatureUnit.celsius
              ? '${widget.weather.forecast!.forecastday?[widget.day].day?.avgtempC ?? 0}°'
              : '${widget.weather.forecast!.forecastday?[widget.day].day?.avgtempF ?? 0}°',
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: 90, fontWeight: FontWeight.w500),
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
            ? 'https:${widget.weather.current?.condition?.icon}'
            : 'https:${widget.weather.forecast!.forecastday?[widget.day].day?.condition?.icon}',
      ),
    );
  }
}
