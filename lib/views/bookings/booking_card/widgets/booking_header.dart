import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class BookingHeader extends StatelessWidget {
  final String bookingId;
  final String roomName;

  const BookingHeader({
    super.key,
    required this.bookingId,
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          roomName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black87,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(200),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'ID: $bookingId',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
