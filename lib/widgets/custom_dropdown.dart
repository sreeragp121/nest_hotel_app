import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? hintText;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final safeValue = items.contains(value) ? value : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey300, width: 1),
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.white,
          hint: Text(
            hintText ?? 'Select an item',
            style: TextStyle(color: AppColors.black38, fontSize: 14),
          ),

          value: safeValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          isExpanded: true,
          style: const TextStyle(color: AppColors.black, fontSize: 16),
          items:
              items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
          onChanged: (String? newValue) {
            onChanged(newValue);
          },
        ),
      ),
    );
  }
}
