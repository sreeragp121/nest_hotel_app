import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/basic_info_screen/year_selection_dropdown.dart';
import 'package:nest_hotel_app/views/registration_pages/location_selection_screen/location_selection_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_field_car.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/my_form_section_header.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();
     final MyAppValidators myAppValidators=MyAppValidators();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Basic Information',
        leadingIcon: Icons.hotel_rounded,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Progress indicator
                    RegistrationProgressIndicator(flex1: 2, flex2: 5),

                    const SizedBox(height: 24),
                    const Text(
                      'Let\'s get started with your property details',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Hotel Name TextField
                    const FormSectionHeader(
                      title: "Property Name",
                      icon: Icons.apartment_rounded,
                    ),
                    const SizedBox(height: 12),
                    MyFormFieldCard(
                      child: MyCustomTextFormField(
                        controller: registrationController.stayNameController,
                        labelText: 'Stay/Hotel name',
                        hintText: 'Enter your Stay/Hotel name',
                        borderColor: AppColors.grey,
                        prefixIcon: Icons.business_rounded,
                        validator:
                            (value) => myAppValidators.validateNames(
                              value,
                              name: 'Stay/Hotel Name',
                            ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    MyFormFieldCard(
                      child: MyCustomTextFormField(
                        controller:
                            registrationController.hotelDescriptionController,
                        labelText: 'Stay/Hotel Description',
                        hintText: 'Enter your Stay/Hotel Description',
                        borderColor: AppColors.grey,
                        prefixIcon: Icons.business_rounded,
                        validator:
                            (value) => myAppValidators.validateNames(
                              value,
                              name: 'Stay/Hotel Name',
                            ),
                        maxLines: 10,
                      ),
                    ),
                    const SizedBox(height: 12),
                    MyFormFieldCard(
                      child: MyCustomTextFormField(
                        controller:
                            registrationController.hotelBasePrice,
                        labelText: 'Base Price',
                        hintText: 'Enter your Stay/Hotel Base Price',
                        borderColor: AppColors.grey,
                        prefixIcon: Icons.business_rounded,
                        validator:
                            (value) => myAppValidators.validateNames(
                              value,
                              name: 'Stay/Hotel Name',
                            ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Year Since Operating
                    const FormSectionHeader(
                      title: "Taking Bookings Since",
                      icon: Icons.calendar_today_rounded,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withAlpha(5),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const YearSelectionDropdown(),
                    ),

                    const SizedBox(height: 32),

                    // Contact Details
                    const FormSectionHeader(
                      title: "Contact Details",
                      icon: Icons.contact_phone_rounded,
                    ),
                    const SizedBox(height: 12),
                    MyFormFieldCard(
                      title: "Phone Number",
                      subtitle: "We'll use this to notify you about bookings",
                      child: MyCustomTextFormField(
                        controller:
                            registrationController.contactNumberController,
                        labelText: 'Contact Number',
                        hintText: 'Phone Number',
                        prefixIcon: Icons.phone_rounded,
                        borderColor: AppColors.grey,
                        validator: myAppValidators.validatePhone,
                        keyboardType: TextInputType.phone,
                      ),
                    ),

                    const SizedBox(height: 20),
                    MyFormFieldCard(
                      title: "Email Address",
                      subtitle: "For sending booking confirmations",
                      child: MyCustomTextFormField(
                        controller: registrationController.emailController,
                        labelText: 'Email Address',
                        hintText: 'Email Address',
                        prefixIcon: Icons.email_rounded,
                        borderColor: AppColors.grey,
                        validator: myAppValidators.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: MyCustomButton(
          width: double.infinity,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.to(
                () => HotelLocationDetailsPage(),
                transition: Transition.rightToLeft,
              );
            }
          },
          backgroundcolor: AppColors.primary,
          textcolor: AppColors.background,
          text: 'Continue to Location',
        ),
      ),
    );
  }
}
