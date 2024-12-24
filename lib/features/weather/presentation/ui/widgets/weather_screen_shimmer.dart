import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:weather/application/theme_data/app_colors.dart';

class WeatherScreenShimmer extends StatelessWidget {
  const WeatherScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor.withOpacity(0.02),
      body: Shimmer(
        colorOpacity: 0.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  _buildShimmerBox(height: 38, width: 150, borderRadius: 12),
                  const Gap(10),
                  _buildShimmerBox(height: 16, width: 60),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildShimmerBox(
                        height: 100,
                        width: 100,
                        borderRadius: 12,
                      ),
                      const Gap(24),
                      _buildShimmerBox(
                        height: 100,
                        width: 100,
                        borderRadius: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildShimmerBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width / 3,
                    borderRadius: 24,
                  ),
                  const Gap(8),
                  _buildShimmerBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width / 3,
                    borderRadius: 24,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(6, (index) => _buildHourlyForecastItem()),
              ),
            ),
            const Spacer(),
            _buildShimmerLargeBox(context, 80),
            const Gap(8),
            _buildShimmerLargeBox(context, 80),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox({
    required double height,
    required double width,
    double borderRadius = 0,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget _buildHourlyForecastItem() {
    return Column(
      children: [
        _buildShimmerBox(height: 110, width: 50, borderRadius: 25),
        const Gap(10),
        _buildShimmerBox(height: 10, width: 10, borderRadius: 50),
      ],
    );
  }

  Widget _buildShimmerLargeBox(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _buildShimmerBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        borderRadius: 10,
      ),
    );
  }
}
