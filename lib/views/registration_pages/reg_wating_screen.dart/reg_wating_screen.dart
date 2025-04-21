import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';

class RegWatingScreen extends StatelessWidget {
  RegWatingScreen({super.key});
  final verificationController = Get.put(ProfileDataController());

  @override
  Widget build(BuildContext context) {
    verificationController.listenToVerificationStatus();
    return Scaffold(
      body: Obx(() {
        if (verificationController.isApproved.value) {
          Future.microtask(() => Get.offAll(() => MyNavigationBar()));
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/verification.png'),
              ),

              const SizedBox(height: 20),
              const SizedBox(
                width: 250,
                child: Text(
                  "Yay!! Our team is verifying your hotel. Please wait a moment!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        );
      }),
    );
  }
}
