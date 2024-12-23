import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/theme_data/app_colors.dart';

import 'package:weather/features/common/presentation/ui/widgets/app_gradient_bg.dart';

import 'package:weather/features/common/presentation/ui/widgets/app_ink_well_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: AppGradientBG(
        child: Column(
          children: [
            const Gap(49),
            Text(
              'Dhaka',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 42, fontWeight: FontWeight.w600),
            ),
            const Gap(8),
            AppInkWellWidget(
              onTap: () {},
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: white,
                      size: 16,
                    ),
                    const Gap(8),
                    Text(
                      'Current Location',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
