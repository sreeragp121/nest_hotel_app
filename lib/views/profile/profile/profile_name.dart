import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/hotel_profile_data_controller.dart';

class ProfileName extends StatelessWidget {
  ProfileName({super.key});
  final profileDataController = Get.find<ProfileDataController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 20),
      child: Column(
        children: [
          Text(
            profileDataController.profileData.value!.stayName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            profileDataController.profileData.value!.email,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
