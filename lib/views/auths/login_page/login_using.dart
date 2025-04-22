import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nest_hotel_app/controllers/auth_controller.dart';

class LoginUsing extends StatelessWidget {
  const LoginUsing({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          const Divider(thickness: 0.5, color: Colors.grey),
          const Text(
            'Log In using',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  authController.regUsingGoogleAcc();
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/icons/google_icon.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
