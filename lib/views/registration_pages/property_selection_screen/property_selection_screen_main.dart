import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/basic_info_screen/basic_info_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/property_selection_screen/set_property_type.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class PropertySelectionScreen extends StatelessWidget {
  const PropertySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyTypes = [
      'Hotel',
      'Resort',
      'Bungalow',
      'Dorm',
      'Cottage',
      'Apartment',
    ];

    final propertyController = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What you like to List?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: propertyTypes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              color:
                                  propertyController.accommodationTypeindex.value ==
                                          index
                                      ? AppColors.primary
                                      : AppColors.white,
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              title: Text(
                                propertyTypes[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      propertyController.accommodationTypeindex.value ==
                                              index
                                          ? AppColors.white
                                          : AppColors.black,
                                ),
                              ),
                              onTap: () {
                                propertyController.selectProperty(index);
                                propertyController.accommodationType.value=propertyTypes[index];
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //check boxs for select the property type
              SetPropertyType(),

              MyCustomButton(
                width: double.infinity,
                onPressed: () {
                  Get.to(BasicInformationScreen());
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
