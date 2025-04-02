import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/location_selection_screen.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> years = ['2021', '2020', '2019', '2018', '2017'];

    final PropertyControllers = Get.find<RegistrationController>();

    final TextEditingController hotelNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Hotel Name TextField
                MyCustomTextFormField(
                  controller: hotelNameController,
                  labelText: 'Stay/Hotel Name',
                  borderColor: Colors.grey,
                ),

                const SizedBox(height: 16),
                const Text(
                  'Taking Bookings Since',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),

                // Year Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Obx(() {
                      return DropdownButton<String>(
                        value: PropertyControllers.selectedYear.value,
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
                          PropertyControllers.setSelectedYear(newValue);
                        },
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Contact Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),

                // Contact Number TextField
                MyCustomTextFormField(
                  controller: phoneNumberController,
                  labelText: 'Contact Number',
                  borderColor: Colors.grey,
                ),

                const SizedBox(height: 12),

                // Email Address TextField
                MyCustomTextFormField(
                  controller: emailController,
                  labelText: 'Email Address',
                  borderColor: Colors.grey,
                ),

                const Spacer(),

                // Next Button
                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    Get.to(LocationPermissionScreen());
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
