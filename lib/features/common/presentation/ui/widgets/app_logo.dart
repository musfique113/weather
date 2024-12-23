import 'package:flutter/material.dart';
import 'package:weather/application/helpers/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.appLogoPng,
      height: height ?? 120,
      width: width ?? 120,
    );
  }
}
