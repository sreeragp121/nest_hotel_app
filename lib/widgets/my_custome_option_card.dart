import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class MycustomOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final Color primaryColor;
  final Function() onTap;

  const MycustomOptionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    this.primaryColor = AppColors.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withAlpha(20) : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryColor : AppColors.grey.withAlpha(100),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: primaryColor.withAlpha(40),
                blurRadius: 8,
                offset: const Offset(0, 2),
              )
            else
              BoxShadow(
                color: AppColors.black.withAlpha(10),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? primaryColor.withAlpha(30)
                        : Colors.grey.withAlpha(20),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 28,
                color: isSelected ? primaryColor : AppColors.grey600,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? primaryColor : AppColors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: isSelected ? AppColors.black87 : AppColors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.transparent,
                borderRadius: BorderRadius.circular(8),
                border:
                    isSelected
                        ? null
                        : Border.all(
                          color: AppColors.grey.withAlpha(120),
                          width: 1.5,
                        ),
              ),
              child:
                  isSelected
                      ? const Icon(
                        Icons.check_rounded,
                        color: AppColors.white,
                        size: 20,
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
