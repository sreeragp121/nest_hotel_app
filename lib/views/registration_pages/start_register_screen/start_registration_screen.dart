import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/property_selection_screen/property_selection_screen_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class StartRegisterScreen extends StatelessWidget {
  const StartRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                "Yay!! We have registered your email with us you can start registration process,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 100),
            MyCustomButton(
              width: 350,
              onPressed: () {
                Get.to(PropertySelectionScreen());
              },
              backgroundcolor: AppColors.primary,
              textcolor: AppColors.background,
              text: 'Start Registration',
            ),
          ],
        ),
      ),
    );
  }
}
