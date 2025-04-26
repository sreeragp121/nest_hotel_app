import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/finance_legal_selection_card.dart';

class PropertyInformation extends StatelessWidget {
  const PropertyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    return Column(
      children: [
        SizedBox(height: 30),
        // Property information section
        Text(
          'Property Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black87,
          ),
        ),

        SizedBox(height: 20),

        // Property ownership selection
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Is your property owned or leased?',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.black87,
              ),
            ),
            SizedBox(height: 12),
            Obx(
              () => Row(
                children: [
                  SelectionCard(
                    title: 'Owned',
                    icon: Icons.home_work,
                    isSelected: controller.propertyType.value == 'Owned',
                    onTap: () => controller.setPropertyType('Owned'),
                  ),
                  SizedBox(width: 16),
                  SelectionCard(
                    title: 'Leased',
                    icon: Icons.description_outlined,
                    isSelected: controller.propertyType.value == 'Leased',
                    onTap: () => controller.setPropertyType('Leased'),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 24),

        // Registration selection
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do you have property registration?',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.black87,
              ),
            ),
            SizedBox(height: 12),
            Obx(
              () => Row(
                children: [
                  SelectionCard(
                    title: 'Yes',
                    icon: Icons.check_circle_outline,
                    isSelected: controller.hasRegistration.value == 'Yes',
                    onTap: () => controller.setRegistration('Yes'),
                  ),
                  SizedBox(width: 16),
                  SelectionCard(
                    title: 'No',
                    icon: Icons.cancel_outlined,
                    isSelected: controller.hasRegistration.value == 'No',
                    onTap: () => controller.setRegistration('No'),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 40),
      ],
    );
  }
}
