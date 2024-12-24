import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_bottom_view.dart';
import 'package:weather/features/common/presentation/ui/widgets/sunrise_sunset_info_card.dart';
import 'package:weather/features/common/presentation/ui/widgets/uv_info_card.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class SunriseSunsetUVInfoWidget extends StatelessWidget {
  const SunriseSunsetUVInfoWidget({
    required this.data,
    required this.day,
    super.key,
  });

  final WeatherModel data;
  final int day;

  @override
  Widget build(BuildContext context) {
    final sunrise = data.forecast?.forecastday?[day].astro?.sunrise ?? '';
    final sunset = data.forecast?.forecastday?[day].astro?.sunset ?? '';

    return AppBottomView(
      child: Column(
        children: [
          const Gap(48),
          SunriseSunsetInfoCard(sunset: sunset, sunrise: sunrise),
          const Gap(15),
          UVInfoCard(
            uvLevel: (day == 0
                        ? data.current?.uv
                        : data.forecast?.forecastday?[day].day?.uv)
                    ?.toDouble() ??
                0,
          ),
        ],
      ),
    );
  }
}
