import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.indigoOpacity50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.indigo[400], size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
