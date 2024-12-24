import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/presentation/ui/widgets/hourly_forecast_item_card.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({
    required this.data,
    required this.day,
    super.key,
  });

  final WeatherModel data;
  final int day;

  @override
  Widget build(BuildContext context) {
    final totalHours = data.forecast?.forecastday?[day].hour?.length ?? 0;
    return SizedBox(
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 12, right: 12),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final hourlyForecast = data.forecast?.forecastday?[day].hour?[index];
          return HourlyForecastItemCard(
            hourlyForecast: hourlyForecast!,
          );
        },
        separatorBuilder: (context, index) {
          return const Gap(8);
        },
        itemCount: totalHours,
      ),
    );
  }
}
