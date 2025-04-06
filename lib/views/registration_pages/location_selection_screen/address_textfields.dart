import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddressTextfields extends StatelessWidget {
  const AddressTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.find<RegistrationController>();
    return Column(
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
        ),
      ],
    );
  }
}
