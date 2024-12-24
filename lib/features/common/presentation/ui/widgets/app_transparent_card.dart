import 'package:flutter/material.dart';
import 'package:weather/application/theme_data/app_colors.dart';

class AppTransparentCard extends StatelessWidget {
  const AppTransparentCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        gradient: transparentCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: darkGray),
      ),
      child: child,
    );
  }
}
