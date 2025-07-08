import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_field_car.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_section_header.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddressTextfields extends StatelessWidget {
  const AddressTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.find<RegistrationController>();
    final MyAppValidators myAppValidators=MyAppValidators();

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
            prefixIcon: Icons.location_city,
            validator:
                (value) => myAppValidators.validateNames(value, name: 'City'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'State',
          child: MyCustomTextFormField(
            controller: regController.stateController,
            hintText: 'Enter The State',
            prefixIcon: Icons.account_balance,
            validator:
                (value) => myAppValidators.validateNames(value, name: 'State'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'Country',
          child: MyCustomTextFormField(
            controller: regController.countryController,
            hintText: 'Enter The Country',
            prefixIcon: Icons.public,
            validator:
                (value) =>
                    myAppValidators.validateNames(value, name: 'Country'),
          ),
        ),
        SizedBox(height: 10),
        MyFormFieldCard(
          title: 'Pincode',
          child: MyCustomTextFormField(
            controller: regController.pincodeController,
            hintText: 'Enter The Pincode',
            prefixIcon: Icons.location_on,
            validator:
                (value) =>
                    myAppValidators.validateNames(value, name: 'Pincode'),
          ),
        ),
      ],
    );
  }
}
