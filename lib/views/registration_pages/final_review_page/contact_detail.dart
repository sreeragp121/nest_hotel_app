import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewContactDetails extends StatelessWidget {
  final RegistrationController registrationController;

  const ReviewContactDetails({
    super.key,
    required this.registrationController,

  });

  @override
  Widget build(BuildContext context) {
    final MyAppValidators myAppValidators = MyAppValidators();
    return Column(
      children: [
        const SectionTitle(title: 'Contact Details'),
        MyCustomTextFormField(
          controller: registrationController.contactNumberController,
          labelText: 'Contact Number',
          hintText: 'Phone Number',
          prefixIcon: Icons.phone_rounded,
          borderColor: AppColors.grey,
          validator: myAppValidators.validatePhone,
          keyboardType: TextInputType.phone,

        ),

        const SizedBox(height: 20),
        MyCustomTextFormField(
          controller: registrationController.emailController,
          labelText: 'Email Address',
          hintText: 'Email Address',
          prefixIcon: Icons.email_rounded,
          borderColor: AppColors.grey,
          validator: myAppValidators.validateEmail,
          keyboardType: TextInputType.emailAddress,

        ),
      ],
    );
  }
}
