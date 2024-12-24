import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/helpers/assets_path.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_transparent_card.dart';

class SunriseSunsetInfoCard extends StatefulWidget {
  const SunriseSunsetInfoCard({
    required this.sunset,
    required this.sunrise,
    super.key,
  });

  final String sunset;
  final String sunrise;

  @override
  State<SunriseSunsetInfoCard> createState() => _SunriseSunsetInfoCardState();
}

class _SunriseSunsetInfoCardState extends State<SunriseSunsetInfoCard> {
  @override
  Widget build(BuildContext context) {
    return AppTransparentCard(
      child: Row(
        children: [
          _buildIcon(),
          const Gap(24),
          _buildTimeColumn('Sunset', widget.sunset),
          const Gap(24),
          _buildTimeColumn('Sunrise', widget.sunrise),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Image.asset(
      AssetsPath.sunPng,
      height: 56,
      width: 56,
      fit: BoxFit.fill,
    );
  }

  Widget _buildTimeColumn(String label, String time) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        _buildTimeText(time),
      ],
    );
  }

  Widget _buildTimeText(String time) {
    final timeParts = time.split(' ');
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: timeParts[0],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextSpan(
            text: timeParts[1],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
