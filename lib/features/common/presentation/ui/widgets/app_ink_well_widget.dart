import 'package:flutter/material.dart';

class AppInkWellWidget extends StatelessWidget {
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final VoidCallback onTap;
  final Color? highlightColor;

  const AppInkWellWidget({
    required this.child,
    required this.onTap,
    super.key,
    this.radius,
    this.highlightColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Future.delayed(
            const Duration(milliseconds: 100),
            () => onTap(),
          );
        },
        borderRadius: BorderRadius.circular(radius ?? 8),
        highlightColor:
            highlightColor ?? Theme.of(context).primaryColor.withOpacity(0.1),
        hoverColor: Theme.of(context).primaryColor.withOpacity(0.05),
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}
