import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class FacilityChip extends StatelessWidget {
  final String title;
  final bool value;
  final double? height;
  final VoidCallback? chipFunction;

  const FacilityChip({
    super.key,
    required this.title,
    required this.value,
    this.height,
    this.chipFunction,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = value ? AppColors.green : AppColors.red;
    final Color backgroundColor =
        value
            ? AppColors.green.withAlpha((0.15 * 255).toInt())
            : AppColors.red.withAlpha((0.15 * 255).toInt());
    final Color textIconColor = value ? Colors.green[800]! : Colors.red[800]!;

    return InkWell(
      onTap: chipFunction, // Simply pass the function reference directly
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height ?? 36,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withAlpha((0.2 * 255).toInt()),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: primaryColor.withAlpha((0.5 * 255).toInt()),
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              value ? Icons.check_circle_rounded : Icons.cancel_rounded,
              size: 18,
              color: textIconColor,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: textIconColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
