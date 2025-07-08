import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
import 'package:nest_hotel_app/views/profile/account_page_more_options.dart';
import 'package:nest_hotel_app/views/profile/account_page_settings.dart';
import 'package:nest_hotel_app/views/profile/account_profile_section.dart';

class AccountPageMain extends StatelessWidget {
  const AccountPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileDataController profileDataController =
        Get.find<ProfileDataController>();

    return FutureBuilder(
      future: profileDataController.listenToVerificationStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileSection(
                      hotelData: profileDataController.profileData.value!,
                    ),
                    AccPageSettings(),
                    AccPageMoreOptions(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
