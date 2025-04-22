import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/widgets/my_custome_option_card.dart'
    show MycustomOptionCard; // Assuming you have this

class SetPropertyType extends StatelessWidget {
  const SetPropertyType({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Text(
          'Choose how guests will stay at your property',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => MycustomOptionCard(
            title: "Entire Property",
            description: "Guests will have the whole place to themselves",
            icon: Icons.home_rounded,
            isSelected: registrationController.propertyUsage.value,
            onTap: registrationController.selectEntireProperty,
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => MycustomOptionCard(
            title: "Private Property",
            description: "Guests will have private rooms in a shared space",
            icon: Icons.meeting_room_rounded,
            isSelected: !registrationController.propertyUsage.value,
            onTap: registrationController.selectEntireProperty,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
