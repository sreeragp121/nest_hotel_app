import 'package:flutter/material.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewLocationCard extends StatelessWidget {
  final RegistrationController registrationController;

  const ReviewLocationCard({
    super.key,
    required this.registrationController,

  });

  @override
  Widget build(BuildContext context) {
     final MyAppValidators myAppValidators=MyAppValidators();
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
              (value) => myAppValidators.validateNames(value, name: 'City'),
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.stateController,
          hintText: 'Enter The State',
          labelText: 'State',
          prefixIcon: Icons.account_balance,
          validator:
              (value) => myAppValidators.validateNames(value, name: 'State'),
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.countryController,
          hintText: 'Enter The Country',
          labelText: 'Country',
          prefixIcon: Icons.public,
          validator:
              (value) => myAppValidators.validateNames(value, name: 'Country'),
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.pincodeController,
          hintText: 'Enter The Pincode',
          labelText: 'Pincode',
          prefixIcon: Icons.location_on,
          validator:
              (value) => myAppValidators.validateNames(value, name: 'Pincode'),
        ),
      ],
    );
  }
}
