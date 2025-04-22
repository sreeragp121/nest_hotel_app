import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/registration_constants.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/basic_info_screen/basic_info_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/property_selection_screen/select_property_list.dart';
import 'package:nest_hotel_app/views/registration_pages/property_selection_screen/set_property_type.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';

class PropertySelectionScreen extends StatelessWidget {
  const PropertySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(RegistrationController());
    final rgistrationConstants = RegistrationConstants();
    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Start Registration',
        icon: Icons.app_registration,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegistrationProgressIndicator(flex1: 1, flex2: 8),
                const Text(
                  'Which type of property would you like to list?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SelectPropertyList(
                  rgistrationConstants: rgistrationConstants,
                  propertyController: propertyController,
                ),

                SetPropertyType(),

                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    if (propertyController.accommodationTypeindex.value == -1) {
                      MyCustomSnackBar.show(
                        title: 'Selection Required',
                        message:
                            'Please select a property type before proceeding.',
                        icon: Icons.error_outline,
                        backgroundColor: AppColors.red,
                      );
                    } else {
                      Get.to(
                        BasicInformationScreen(),
                        transition: Transition.rightToLeft,
                      );
                    }
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
