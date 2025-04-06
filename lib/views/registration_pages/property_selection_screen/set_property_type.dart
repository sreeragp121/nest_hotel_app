import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/widgets/select_property.dart';

class SetPropertyType extends StatelessWidget {
  const SetPropertyType({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Text(
          'Now would you like to set the Property',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Obx(
          () => MyCheckBox(
            label: "Entire Property",
            selectionFunction: registrationController.selectEntireProperty,
            value: registrationController.entireProperty.value,
          ),
        ),

        const SizedBox(height: 8),
        Obx(
          () => MyCheckBox(
            label: "Private Property",
            selectionFunction: registrationController.selectPrivateProperty,
            value: registrationController.privateProperty.value,
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
