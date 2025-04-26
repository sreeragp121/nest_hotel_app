import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class SelectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey300,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? AppColors.primary.withAlpha(77)
                    : AppColors.black.withAlpha(13), 
                blurRadius: isSelected ? 8 : 4,
                offset: isSelected ? Offset(0, 4) : Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: isSelected ? AppColors.white : AppColors.primary,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.white : AppColors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
