import 'package:flutter/material.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewLegalInfoCard extends StatelessWidget {
  final RegistrationController registrationController;

  const ReviewLegalInfoCard({
    super.key,
    required this.registrationController,

  });

  @override
  Widget build(BuildContext context) {
     final MyAppValidators myAppValidators=MyAppValidators();
    return Column(
      children: [
        const SectionTitle(title: 'Legal Information'),
        MyCustomTextFormField(
          controller: registrationController.panNumberController,
          labelText: 'PAN Number',
          hintText: 'Enter your PAN number',
          prefixIcon: Icons.credit_card,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'PAN Number'),
        ),

        SizedBox(height: 10),

        MyCustomTextFormField(
          controller: registrationController.propertyNumberController,
          labelText: 'Property Number',
          hintText: 'Enter property identification number',
          prefixIcon: Icons.home,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Property Number'),
        ),

        SizedBox(height: 10),

        MyCustomTextFormField(
          controller: registrationController.gstNumberController,
          labelText: 'GST Number',
          hintText: 'Enter GST registration number',
          prefixIcon: Icons.receipt_long,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'GST Details'),

        ),
      ],
    );
  }
}
