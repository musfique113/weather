import 'package:flutter/material.dart';
import 'package:weather/application/helpers/assets_path.dart';

class AppBottomView extends StatelessWidget {
  const AppBottomView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.bottomBGPng),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
