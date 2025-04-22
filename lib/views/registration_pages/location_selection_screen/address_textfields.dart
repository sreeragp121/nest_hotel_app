import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_field_car.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_section_header.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddressTextfields extends StatelessWidget {
  const AddressTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.find<RegistrationController>();
    final formController = Get.find<MyTextfieldController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormSectionHeader(title: "Location", icon: Icons.location_pin),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'City',
          child: MyCustomTextFormField(
            controller: regController.cityController,
            hintText: 'Enter The City',
            prefixIcon: Icon(Icons.location_city),
            validator:
                (value) => formController.validateNames(value, name: 'City'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'State',
          child: MyCustomTextFormField(
            controller: regController.stateController,
            hintText: 'Enter The State',
            prefixIcon: Icon(Icons.account_balance),
            validator:
                (value) => formController.validateNames(value, name: 'State'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'Country',
          child: MyCustomTextFormField(
            controller: regController.countryController,
            hintText: 'Enter The Country',
            prefixIcon: Icon(Icons.public),
            validator:
                (value) =>
                    formController.validateNames(value, name: 'Country'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'Pincode',
          child: MyCustomTextFormField(
            controller: regController.pincodeController,
            hintText: 'Enter The Pincode',
            prefixIcon: Icon(Icons.location_on),
            validator:
                (value) =>
                    formController.validateNames(value, name: 'Pincode'),
          ),
        ),
      ],
    );
  }
}
