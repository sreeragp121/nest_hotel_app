import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class EnhancedBookingCard extends StatelessWidget {
  final int count;
  final Widget percentageChangeWidget;
  final Gradient? gradient;
  final String heading;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final VoidCallback? ontap;

  const EnhancedBookingCard({
    super.key,
    required this.count,
    this.heading = '',
    this.ontap,
    this.percentageChangeWidget = const SizedBox(),
    this.gradient,
    this.icon = Icons.book,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: gradient,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: iconColor, size: 24),
                    ),
                    percentageChangeWidget,
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black87,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      heading,
                      style: TextStyle(color: AppColors.grey600, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
