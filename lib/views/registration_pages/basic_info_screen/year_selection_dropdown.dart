import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';

class YearSelectionDropdown extends StatelessWidget {
  const YearSelectionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> years = [
      '2025',
      '2024',
      '2023',
      '2022',
      '2021',
      '2020',
      '2019',
      '2018',
      '2017',
      '2016',
      '2015',
    ];

    final propertyControllers = Get.find<RegistrationController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(() {
          return DropdownButton<String>(
            dropdownColor: AppColors.background,
            value: propertyControllers.selectedYear.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: const Text("Select Year"),
            items:
                years.map((String year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
            onChanged: (newValue) {
              propertyControllers.setSelectedYear(newValue);
            },
          );
        }),
      ),
    );
  }
}
