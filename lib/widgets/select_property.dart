import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class MyCheckBox extends StatelessWidget {
  final String label;
 final bool value;
  final VoidCallback selectionFunction;

  const MyCheckBox({
    super.key,
    required this.label,
    required this.value,
    required this.selectionFunction,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: 
            Checkbox(
              value: value,
              onChanged: (value) {
                selectionFunction();
              },
              fillColor: WidgetStateProperty.resolveWith((states) {
                return value ? AppColors.primary : AppColors.grey;
              }),
              checkColor: AppColors.background,
            ),
        ),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
