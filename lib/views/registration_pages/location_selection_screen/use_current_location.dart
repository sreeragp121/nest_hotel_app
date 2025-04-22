import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';

class UseCurrentLocation extends StatelessWidget {
  const UseCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.find<RegistrationController>();

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            regController.getCurrentLocation();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.my_location, color: AppColors.primary),
                  SizedBox(width: 16),
                  Text(
                    'Use Current Location',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF0F4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Please provide accurate location details to help guests find your property easily.',
            style: TextStyle(color: Color(0xFF1A7F8C), fontSize: 15),
          ),
        ),
      ],
    );
  }
}
