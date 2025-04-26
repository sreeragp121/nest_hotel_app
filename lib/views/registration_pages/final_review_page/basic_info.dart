import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/registration_constants.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/booking_year_dropdown.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/property_dropdown.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewPageBasicInfo extends StatelessWidget {
  final RegistrationController registrationController;
  final MyTextfieldController formController;
  const ReviewPageBasicInfo({
    super.key,
    required this.registrationController,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    final registrationConstants = RegistrationConstants();
    return Column(
      children: [
        const SectionTitle(title: 'Basic Information'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Type',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black54,
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: SelectPropertyDropdown(
                values: registrationConstants.propertyTypes,
                controller: registrationController,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.stayNameController,
          labelText: 'Hotel Name',
          borderColor: AppColors.grey,
          prefixIcon: Icons.business_rounded,
          validator:
              (value) =>
                  formController.validateNames(value, name: 'Stay/Hotel Name'),
          readOnly: registrationController.editPageReadOnly.value,
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Type',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black54,
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: SelectYearDropdown(
                values: registrationConstants.years,
                controller: registrationController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
