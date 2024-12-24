import 'package:flutter/material.dart';
import 'package:weather/application/theme_data/app_colors.dart';

class AppGradientBG extends StatelessWidget {
  const AppGradientBG({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: appGradient,
      ),
      child: child,
    );
  }
}
