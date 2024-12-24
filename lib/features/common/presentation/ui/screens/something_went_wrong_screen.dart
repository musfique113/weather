import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather/application/helpers/assets_path.dart';
import 'package:weather/application/theme_data/app_colors.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  const SomethingWentWrongScreen({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.someThingWentWrongPng,
              fit: BoxFit.cover,
              height: 200,
            ),
            Text(
              'Ahh! Something Went Wrong',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            const Gap(8),
            Text(
              errorMessage ?? 'Brace yourself till we get the error fixed',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: darkGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
