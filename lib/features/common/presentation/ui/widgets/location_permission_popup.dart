import 'package:flutter/material.dart';
import 'package:weather/application/app_router/app_router.dart';
import 'package:weather/application/theme_data/app_colors.dart';

void showPermissionDeniedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Permission Denied',
        style: TextStyle(color: white),
      ),
      content: const Text('Location permission is required to use this app. '
          'Please grant permission from your device settings.'),
      actions: [
        TextButton(
          onPressed: () => AppRouter.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
