import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/time_controller.dart';

class TimeBoxWidget extends StatelessWidget {
  final String label;
  final String iconName;
  final TimeOfDay? time;
  final VoidCallback onTap;
  final TimeController controller;

  const TimeBoxWidget({
    super.key,
    required this.label,
    required this.iconName,
    required this.time,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon =
        iconName == "in" ? Icons.login_rounded : Icons.logout_rounded;
    Color color = iconName == "in" ? AppColors.primary : AppColors.red;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 20),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              controller.formatTime(time),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
