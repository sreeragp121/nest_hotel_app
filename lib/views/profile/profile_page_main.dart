import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/hotel_profile_controller.dart';
import 'package:nest_hotel_app/views/profile/account_page_more_options.dart';
import 'package:nest_hotel_app/views/profile/account_page_settings.dart';
import 'package:nest_hotel_app/views/profile/account_profile_section.dart';

class AccountPageMain extends StatelessWidget {
  const AccountPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final HotelProfileController profileDataController =
        Get.find<HotelProfileController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Hotel Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  if (profileDataController.profileData.value == null) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ProfileSection(
                    hotelData: profileDataController.profileData.value!,
                  );
                }),
                AccPageSettings(),
                AccPageMoreOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
