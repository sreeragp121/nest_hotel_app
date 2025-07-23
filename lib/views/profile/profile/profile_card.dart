import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/hotel_profile_data_controller.dart';
import 'package:nest_hotel_app/views/profile/profile/profile_items.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});
  final profileDataController = Get.find<ProfileDataController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InfoItem(
                icon: Icons.hotel,
                title: 'Hotel Name',
                value: profileDataController.profileData.value!.stayName,
              ),
              InfoItem(
                icon: Icons.villa,
                title: 'Hotel Type',
                value:
                    profileDataController.profileData.value!.accommodationType,
              ),
              InfoItem(
                icon: Icons.location_on,
                title: 'Location',
                value: profileDataController.profileData.value!.state,
              ),
              InfoItem(
                icon: Icons.phone,
                title: 'Contact Number',
                value: profileDataController.profileData.value!.contactNumber,
              ),
              InfoItem(
                icon: Icons.post_add,
                title: 'Pincode',
                value: profileDataController.profileData.value!.pincode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
