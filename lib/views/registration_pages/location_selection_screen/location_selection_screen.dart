import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/policies_screen/policies_screen_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'Enable location',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),
              const Text(
                'You need to enable loaction to browse stays near you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const Spacer(flex: 2),

              // Allow Location button
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                  onPressed: () {
                    Get.to(PoliciesScreenMain());
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.background,
                  text: 'Allow Location',
                ),
              ),

              const SizedBox(height: 16),
              // Enter Manually text button
              TextButton(
                onPressed: () {
                  Get.to(PoliciesScreenMain());
                },
                child: const Text(
                  'Enter Manually',
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
