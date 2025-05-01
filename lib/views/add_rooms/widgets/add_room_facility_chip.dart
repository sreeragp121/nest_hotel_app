import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class AddRoomFacilityChip extends StatelessWidget {
  final String title;
  final bool value;
  final IconData icon;
  final ValueChanged<bool?> onChanged;
  final double? height;

  const AddRoomFacilityChip({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onChanged,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = value ? AppColors.green : AppColors.red;
    final Color backgroundColor = value 
        ? AppColors.green.withAlpha((0.15 * 255).toInt())
        : AppColors.red.withAlpha((0.15 * 255).toInt());
    final Color textIconColor = value ? Colors.green[800]! : Colors.red[800]!;

    return Material(
      color: AppColors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
        child: InkWell(
          onTap: () => onChanged(!value),
          borderRadius: BorderRadius.circular(18),
          splashColor: primaryColor.withAlpha((0.1 * 255).toInt()),
          highlightColor: primaryColor.withAlpha((0.05 * 255).toInt()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: value 
                        ? primaryColor.withAlpha((0.2 * 255).toInt())
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: textIconColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textIconColor,
                      fontWeight: value ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: 0.3,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}