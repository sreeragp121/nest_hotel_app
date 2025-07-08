import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/registration_constants.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/booking_year_dropdown.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/property_dropdown.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ReviewPageBasicInfo extends StatelessWidget {
  final RegistrationController registrationController;

  const ReviewPageBasicInfo({
    super.key,
    required this.registrationController,
  });

  @override
  Widget build(BuildContext context) {
    final registrationConstants = RegistrationConstants();
    final MyAppValidators myAppValidators=MyAppValidators();
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
          hintText: 'Enter Hotel Name',
          borderColor: AppColors.grey,
          prefixIcon: Icons.business_rounded,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Stay/Hotel Name'),
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.hotelDescriptionController,
          labelText: 'Hotel Description',
          hintText: 'Enter Hotel Description',
          borderColor: AppColors.grey,
          prefixIcon: Icons.business_rounded,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Stay/Hotel Name'),
          maxLines: 10,
        ),
        SizedBox(height: 10),
        MyCustomTextFormField(
          controller: registrationController.hotelBasePrice,
          labelText: 'Hotel Base Price',
          hintText: 'Enter Hotel Base Price',
          borderColor: AppColors.grey,
          prefixIcon: Icons.business_rounded,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Price'),
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
