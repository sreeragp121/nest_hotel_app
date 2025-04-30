import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class CustomSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Color textColor;

  const CustomSection({
    super.key,
    required this.title,
    required this.children,
    this.textColor = const Color(0xFF2D3142),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }
}
