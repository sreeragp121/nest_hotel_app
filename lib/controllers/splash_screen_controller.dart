import 'dart:developer';

import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/reg_wating_screen.dart/reg_wating_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/start_register_screen/start_registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';
import 'package:nest_hotel_app/views/home_page.dart/home_page.dart';

class SplashScreenController extends GetxController {
  final VerificationController verificationController = Get.put(
    VerificationController(),
  );

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await checkUserLogin();

    if (!isLoggedIn) {
      Get.off(() => const LogInPageMain());
      // return;
    } else {
      verificationController
          .listenToVerificationStatus(); // Make sure status is checked

      // Delay briefly to allow verificationController to update values
      await Future.delayed(const Duration(milliseconds: 500));

      final isRegistered = verificationController.isRegisterd.value;
      final isApproved = verificationController.isApproved.value;
      log('splash${isRegistered}');
      log('splash${isApproved}');
      if (isRegistered) {
        if (isApproved) {
          Get.off(() => const MyHomeScreen());
        } else {
          Get.off(() => RegWatingScreen());
        }
      } else {
        Get.off(() => const StartRegisterScreen());
      }
    }
  }

  Future<bool> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
