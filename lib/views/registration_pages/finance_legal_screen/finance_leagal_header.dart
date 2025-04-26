import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class FinanceLeagalHeader extends StatelessWidget {
  const FinanceLeagalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withAlpha(5), width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.primary, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Please provide accurate financial and legal information for your property registration.',
              style: TextStyle(
                color: AppColors.black87,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
