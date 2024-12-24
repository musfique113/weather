import 'package:flutter/material.dart';
import 'package:weather/application/theme_data/app_colors.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_ink_well_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWellWidget(
      onTap: onTap,
      radius: 48,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? customButtonSelected : customButtonUnSelected,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
