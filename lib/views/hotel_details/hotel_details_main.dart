import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_amenities_Section/hotel_amenities_section.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_contact_section/hotel_contact_details.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_detail_section/hotel_detail_section.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_miage_section/hotel_detail_image_section.dart';

class HotelDetailsMain extends StatelessWidget {
  const HotelDetailsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileDataController profileDataController =
        Get.find<ProfileDataController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HotelDetailsImageSection(
              hotelData: profileDataController.profileData.value!,
            ),
            HotelDetailSection(
              hotelData: profileDataController.profileData.value!,
            ),
            HotelAmenitiesSection(
              hotelData: profileDataController.profileData.value!,
            ),
            ContactDetailsWidget(
              email: profileDataController.profileData.value!.email,
              phoneNumber:
                  profileDataController.profileData.value!.contactNumber,
            ),
          ],
        ),
      ),
    );
  }
}
