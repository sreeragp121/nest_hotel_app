import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/controllers/bookins_controller/booking_controller.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/hotel_profile_data_controller.dart';
import 'package:nest_hotel_app/controllers/review_controller/review_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/controllers/room_controller/time_controller.dart';
import 'package:nest_hotel_app/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(TimeController());
  Get.put(AuthController());
  Get.put(RoomControllerNew());
  Get.put(ProfileDataController());
  Get.put(ReviewController());
  Get.put(HotelBookingController());
  Get.put(AddImageController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nest Hotel App',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: SplashScreen(),
      // home: FinalReview(),
      // home: MyNavigationBar(),
    );
  }
}
