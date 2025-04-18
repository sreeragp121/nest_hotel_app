import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/policies_screen/policies_screen_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddressTextfields extends StatelessWidget {
  const AddressTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.find<RegistrationController>();
    final formController = Get.find<MyTextfieldController>();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          MyCustomTextFormField(
            controller: regController.cityController,
            hintText: 'Enter The City',
            prefixIcon: Icon(Icons.location_city),
            validator:
                (value) => formController.validateNames(value, name: 'City'),
          ),
          Text(
            'State',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          MyCustomTextFormField(
            controller: regController.stateController,
            hintText: 'Enter The State',
            prefixIcon: Icon(Icons.account_balance),
            validator:
                (value) => formController.validateNames(value, name: 'State'),
          ),
          Text(
            'Country',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          MyCustomTextFormField(
            controller: regController.countryController,
            hintText: 'Enter The Country',
            prefixIcon: Icon(Icons.public),
            validator:
                (value) => formController.validateNames(value, name: 'Country'),
          ),
          Text(
            'Pincode',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          MyCustomTextFormField(
            controller: regController.pincodeController,
            hintText: 'Enter The Pincode',
            prefixIcon: Icon(Icons.location_on),
            validator:
                (value) => formController.validateNames(value, name: 'Pincode'),
          ),
          SizedBox(height: 100),
          MyCustomButton(
            width: double.infinity,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Get.to(() => PoliciesScreenMain());
              }
            },
            backgroundcolor: AppColors.primary,
            textcolor: AppColors.white,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
