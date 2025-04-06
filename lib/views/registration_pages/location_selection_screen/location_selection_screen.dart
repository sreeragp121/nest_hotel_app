import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/address_textfields.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/use_current_location.dart';
import 'package:nest_hotel_app/views/registration_pages/policies_screen/policies_screen_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class HotelLocationDetailsPage extends StatelessWidget {
  const HotelLocationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Hotel Location Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UseCurrentLocation(),
            SizedBox(height: 16),
            AddressTextfields(),

            Spacer(),

            MyCustomButton(
              width: double.infinity,
              onPressed: () {
                Get.to(() => PoliciesScreenMain());
              },
              backgroundcolor: AppColors.primary,
              textcolor: AppColors.white,
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
