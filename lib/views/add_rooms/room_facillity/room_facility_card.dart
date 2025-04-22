import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class RoomFacilityCard extends StatelessWidget {
  static const primaryColor = AppColors.primary;
  final String title;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const RoomFacilityCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onChanged(!value),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        value
                            ? AppColors.primary.withAlpha((0.05 * 255).toInt())
                            : AppColors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: value ? primaryColor : AppColors.grey,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: value ? FontWeight.w600 : FontWeight.normal,
                      color: value ? primaryColor : const Color(0xFF2C3E50),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioOption(
                      label: 'No',
                      isSelected: !value,
                      onTap: () => onChanged(false),
                    ),
                    const SizedBox(width: 8),
                    RadioOption(
                      label: 'Yes',
                      isSelected: value,
                      onTap: () => onChanged(true),
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

class RadioOption extends StatelessWidget {
  static const primaryColor = AppColors.primary;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const RadioOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : AppColors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
