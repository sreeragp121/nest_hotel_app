import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/home_page.dart/home_page.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/upload_image.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class FinanceLegalScreen extends StatelessWidget {
  const FinanceLegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();

    final TextEditingController panNumberController = TextEditingController();
    final TextEditingController informationController = TextEditingController();
    final TextEditingController gstDetailsController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Finance & Legal',
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomTextFormField(
                controller: panNumberController,
                labelText: 'PAN Details',
                borderColor: Colors.grey,
              ),
              const SizedBox(height: 20),
              MyCustomTextFormField(
                controller: informationController,
                labelText: 'Property Information',
                borderColor: Colors.grey,
              ),
              const SizedBox(height: 20),
              MyCustomTextFormField(
                controller: gstDetailsController,
                labelText: 'GST Details',
                borderColor: Colors.grey,
              ),

              const SizedBox(height: 20),
              const Text(
                'Property Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),
              const Text(
                'Is your property owned or leased',
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 8),
              Obx(
                () => Row(
                  children: [
                    Radio(
                      value: 'Owned',
                      groupValue: controller.propertyType.value,
                      onChanged:
                          (value) =>
                              controller.setPropertyType(value.toString()),
                      activeColor: AppColors.primary,
                    ),
                    const Text('Owned'),
                    const SizedBox(width: 24),
                    Radio(
                      value: 'Leased',
                      groupValue: controller.propertyType.value,
                      onChanged:
                          (value) =>
                              controller.setPropertyType(value.toString()),
                      activeColor: AppColors.primary,
                    ),
                    const Text('Leased'),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Do you have registration',
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 8),
              Obx(
                () => Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: controller.hasRegistration.value,
                      onChanged:
                          (value) =>
                              controller.setRegistration(value.toString()),
                      activeColor: AppColors.primary,
                    ),
                    const Text('Yes'),
                    const SizedBox(width: 24),
                    Radio(
                      value: 'No',
                      groupValue: controller.hasRegistration.value,
                      onChanged:
                          (value) =>
                              controller.setRegistration(value.toString()),
                      activeColor: AppColors.primary,
                    ),
                    const Text('No'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_copy_outlined,
                    color: Colors.black54,
                  ),
                  label: const Text(
                    'Upload Registration',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
              ),

              const Spacer(),

              // Done Button
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                  onPressed: () {
                    Get.to(() => UploadHotelImages());
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.background,
                  text: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
