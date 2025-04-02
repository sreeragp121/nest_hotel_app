import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';
import 'package:nest_hotel_app/views/home_page.dart/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.put(AuthController());
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    
    bool isLoggedIn = await checkUserLogin();
    if (isLoggedIn) {
      Get.off(() => const MyHomeScreen());
    } else {
      Get.off(() => const LogInPageMain());
    }
  }

  Future<bool> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
