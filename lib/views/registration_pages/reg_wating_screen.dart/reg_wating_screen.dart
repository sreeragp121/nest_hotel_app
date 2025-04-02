import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class RegWatingScreen extends StatelessWidget {
  const RegWatingScreen({super.key});

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
      ),
    );
  }
}
