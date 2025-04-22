import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class RegistrationProgressIndicator extends StatelessWidget {
  final int flex1;
  final int flex2;
  const RegistrationProgressIndicator({
    super.key,
    required this.flex1,
    required this.flex2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flex1,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: flex2,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(50),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
