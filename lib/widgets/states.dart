import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 60,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'Error fetching rooms',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hotel,
            size: 60,
            color: AppColors.blue700,
          ),
          SizedBox(height: 16),
          Text(
            'No rooms available',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.blue700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: AppColors.blue700,
      ),
    );
  }
}
