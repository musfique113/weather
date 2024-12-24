import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/app_router/app_router.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/blocs/location/location_service_cubit.dart';

void showPermissionDeniedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text(
        'Permission Denied',
        style: TextStyle(color: white),
      ),
      content: const Text('Location permission is required to use this app. '
          'Please grant permission from your device settings.'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: white,
          ),
          onPressed: () {
            context
                .read<LocationServiceCubit>()
                .handlePermissionRequestButton();
            AppRouter.pop(context);
          },
          child: const Text('Request permission'),
        ),
      ],
    ),
  );
}
