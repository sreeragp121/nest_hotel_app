import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class LoginPagePhoneAuth extends StatelessWidget {
  LoginPagePhoneAuth({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final formController = Get.find<MyTextfieldController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          authController.showOtpField.value
              ? Column(
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Enter OTP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyCustomTextFormField(
                    controller: otpController,
                    prefixIcon: Icons.lock,
                    labelText: 'OTP',
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: formController.validateOtp,
                  ),
                  const SizedBox(height: 20),
                  MyCustomButton(
                    backgroundcolor: AppColors.primary,
                    textcolor: AppColors.white,
                    text: 'Submit',
                    onPressed: () {
                      authController.verifyOTP(otpController);
                    },
                  ),
                ],
              )
              : Column(
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyCustomTextFormField(
                    controller: phoneNumController,
                    prefixIcon: Icons.phone_android,
                    labelText: 'Phone',
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: formController.validatePhone,
                  ),
                  const SizedBox(height: 20),
                  MyCustomButton(
                    backgroundcolor: AppColors.primary,
                    textcolor: AppColors.white,
                    text: 'Get OTP',
                    onPressed: () {
                      authController.sendOTP(phoneNumController);
                    },
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
