import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/hotel_profile_data_controller.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';
import 'package:nest_hotel_app/views/registration_pages/reg_wating_screen.dart/reg_wating_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/start_register_screen/start_registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';

class SplashScreenController extends GetxController {

  final ProfileDataController verificationController = Get.put(
    ProfileDataController(),
  );

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    bool isLoggedIn = await checkUserLogin();

    if (!isLoggedIn) {
      Get.off(() => const LogInPageMain());

    } else {
     await verificationController
          .getProfileOfHotel(); 

      final isRegistered = verificationController.isRegistered.value;
      final isApproved = verificationController.isApproved.value;
      if (isRegistered) {
        if (isApproved) {
          Get.off(() => MyNavigationBar());
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
