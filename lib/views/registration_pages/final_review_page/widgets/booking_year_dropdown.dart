import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';

class SelectYearDropdown extends StatelessWidget {
  final List values;
  final RegistrationController controller;
  const SelectYearDropdown({
    super.key,
    required this.values,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonFormField<int>(
          dropdownColor: AppColors.white,
          value: null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: InputBorder.none,
            hintText: controller.selectedYear.value,
          ),
          icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
          isExpanded: true,
          items: List.generate(
            values.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text(
                values[index],
                style: TextStyle(fontSize: 16, color: AppColors.black),
              ),
            ),
          ),
          onChanged: (value) {
            if (value != null) {
              controller.selectedYear.value = values[value];
              log(values[value]);
            }
          },
        ),
      ),
    );
  }
}
