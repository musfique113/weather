import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/helpers/assets_path.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_transparent_card.dart';

class UVInfoCard extends StatelessWidget {
  const UVInfoCard({
    required this.uvLevel,
    super.key,
  });

  final double uvLevel;

  @override
  Widget build(BuildContext context) {
    return AppTransparentCard(
      child: Row(
        children: [
          Image.asset(
            AssetsPath.uvPng,
            height: 56,
            width: 56,
            fit: BoxFit.fill,
          ),
          const Gap(24),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UV Index',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                _updateUVIndexLevel(uvLevel),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _updateUVIndexLevel(double uvIndex) {
    String level;

    if (uvIndex <= 2) {
      level = '${uvIndex.toInt()} Low Risk';
    } else if (uvIndex <= 5) {
      level = '${uvIndex.toInt()} Moderate';
    } else if (uvIndex <= 7) {
      level = '${uvIndex.toInt()} High';
    } else if (uvIndex <= 10) {
      level = '${uvIndex.toInt()} Very High';
    } else {
      level = '${uvIndex.toInt()} Extreme';
    }

    return level;
  }
}
