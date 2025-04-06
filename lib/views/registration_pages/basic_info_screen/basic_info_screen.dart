import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/basic_info_screen/year_selection_dropdown.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/location_selection_screen.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Basic Information',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Hotel Name TextField
              MyCustomTextFormField(
                controller: registrationController.stayNameController,
                labelText: 'Stay/Hotel Name',
                borderColor: Colors.grey,
              ),

              const SizedBox(height: 16),
              const Text(
                'Taking Bookings Since',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Year Dropdown
              YearSelectionDropdown(),

              const SizedBox(height: 16),
              const Text(
                'Contact Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Contact Number TextField
              MyCustomTextFormField(
                controller: registrationController.contactNumberController,
                labelText: 'Contact Number',
                borderColor: Colors.grey,
              ),

              const SizedBox(height: 12),

              // Email Address TextField
              MyCustomTextFormField(
                controller: registrationController.emailController,
                labelText: 'Email Address',
                borderColor: Colors.grey,
              ),

              const Spacer(),

              // Next Button
              MyCustomButton(
                width: double.infinity,
                onPressed: () {
                  Get.to(HotelLocationDetailsPage());
                },
                backgroundcolor: AppColors.primary,
                textcolor: AppColors.background,
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
