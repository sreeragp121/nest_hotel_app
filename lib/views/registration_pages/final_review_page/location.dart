import 'package:flutter/material.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_field_car.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewLocationCard extends StatelessWidget {
  final RegistrationController registrationController;
  final MyTextfieldController formController;
  const ReviewLocationCard({
    super.key,
    required this.registrationController,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Location'),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.cityController,
          hintText: 'Enter The City',
          labelText: 'City',
          prefixIcon: Icons.location_city,
          validator:
              (value) => formController.validateNames(value, name: 'City'),
          readOnly: registrationController.editPageReadOnly.value,
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.stateController,
          hintText: 'Enter The State',
          labelText: 'State',
          prefixIcon: Icons.account_balance,
          validator:
              (value) => formController.validateNames(value, name: 'State'),
          readOnly: registrationController.editPageReadOnly.value,
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.countryController,
          hintText: 'Enter The Country',
          labelText: 'Country',
          prefixIcon: Icons.public,
          validator:
              (value) => formController.validateNames(value, name: 'Country'),
          readOnly: registrationController.editPageReadOnly.value,
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.pincodeController,
          hintText: 'Enter The Pincode',
          labelText: 'Pincode',
          prefixIcon: Icons.location_on,
          validator:
              (value) => formController.validateNames(value, name: 'Pincode'),
          readOnly: registrationController.editPageReadOnly.value,
        ),
      ],
    );
  }
}
