import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/address_textfields.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/use_current_location.dart';
import 'package:nest_hotel_app/views/registration_pages/policies_screen/policies_screen_main.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class HotelLocationDetailsPage extends StatelessWidget {
  const HotelLocationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: RegistrationAppBar(
        title: 'Hotel Location',
        leadingIcon: Icons.location_pin,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegistrationProgressIndicator(flex1: 3, flex2: 4),
            SizedBox(height: 16),
            UseCurrentLocation(),
            SizedBox(height: 16),
            Form(key: formKey, child: AddressTextfields()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyCustomButton(
          width: double.infinity,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.to(
                () => PoliciesScreenMain(),
                transition: Transition.rightToLeft,
              );
            }
          },
          backgroundcolor: AppColors.primary,
          textcolor: AppColors.white,
          text: 'Next',
        ),
      ),
    );
  }
}
