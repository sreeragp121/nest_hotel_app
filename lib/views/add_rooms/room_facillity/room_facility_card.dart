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
            color:
                value
                    ? primaryColor.withAlpha((0.1 * 255).toInt())
                    : AppColors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 2),
            spreadRadius: value ? 1 : 0,
          ),
        ],
        border:
            value
                ? Border.all(
                  color: primaryColor.withAlpha((0.2 * 255).toInt()),
                  width: 1.5,
                )
                : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onChanged(!value),
          splashColor: primaryColor.withAlpha((0.1 * 255).toInt()),
          highlightColor: primaryColor.withAlpha((0.05 * 255).toInt()),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        value
                            ? primaryColor.withAlpha((0.15 * 255).toInt())
                            : AppColors.grey.withAlpha((0.1 * 255).toInt()),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:
                        value
                            ? [
                              BoxShadow(
                                color: primaryColor.withAlpha(
                                  (0.1 * 255).toInt(),
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child: Icon(
                    icon,
                    color: value ? primaryColor : AppColors.grey,
                    size: 22,
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
                          fontWeight: value ? FontWeight.w600 : FontWeight.w500,
                          color: value ? primaryColor : const Color(0xFF2C3E50),
                        ),
                      ),
                      if (value)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            'Included in your room',
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor.withAlpha(
                                (0.7 * 255).toInt(),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioOption(
                      label: 'No',
                      isSelected: !value,
                      onTap: () => onChanged(false),
                      highlightColor: Colors.red.withAlpha((0.7 * 255).toInt()),
                    ),
                    const SizedBox(width: 8),
                    RadioOption(
                      label: 'Yes',
                      isSelected: value,
                      onTap: () => onChanged(true),
                      highlightColor: primaryColor,
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
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color highlightColor;

  const RadioOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.highlightColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? highlightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected
                    ? highlightColor
                    : AppColors.grey.withAlpha((0.5 * 255).toInt()),
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: highlightColor.withAlpha((0.3 * 255).toInt()),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
