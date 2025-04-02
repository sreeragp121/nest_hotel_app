import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/finanace_legal_screen_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/select_property.dart';

class PoliciesScreenMain extends StatelessWidget {
  const PoliciesScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();

    return Scaffold(
      appBar: AppBar(title: Text('Policies')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Select the Policies you want to implement.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                MyCheckBox(
                  label: 'Free Cancellation upto 24 hours.',
                  value: registrationController.freeCancellation.value,
                  selectionFunction:
                      registrationController.selectFreeCancellation,
                ),
                MyCheckBox(
                  label: 'Couple Friendly',
                  value: registrationController.coupleFriendly.value,
                  selectionFunction:
                      registrationController.selectCoupleFriendly,
                ),

                MyCheckBox(
                  label: 'Parking Facility',
                  value: registrationController.parking.value,
                  selectionFunction: registrationController.selectParking,
                ),
                MyCheckBox(
                  label: 'Restaurant inside the property ',
                  value: registrationController.restaurantInsideProperty.value,
                  selectionFunction:
                      registrationController.selectrestaurantInsideProperty,
                ),
                Spacer(),
                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    Get.to(FinanceLegalScreen());
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.background,
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
