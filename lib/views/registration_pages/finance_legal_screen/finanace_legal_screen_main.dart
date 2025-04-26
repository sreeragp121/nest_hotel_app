import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/finance_leagal_header.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/property_information.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/upload_image.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class FinanceLegalScreen extends StatelessWidget {
  const FinanceLegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    final formController = Get.find<MyTextfieldController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Finance & Legal',
        leadingIcon: Icons.description,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegistrationProgressIndicator(flex1: 5, flex2: 2),
                SizedBox(height: 10),
                // Header section
                FinanceLeagalHeader(),
                SizedBox(height: 20),
                // Financial information section
                Text(
                  'Tax Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black87,
                  ),
                ),

                SizedBox(height: 20),

                MyCustomTextFormField(
                  controller: controller.panNumberController,
                  labelText: 'PAN Number',
                  hintText: 'Enter your PAN number',
                  prefixIcon: Icons.credit_card,
                  validator:
                      (value) => formController.validateNames(
                        value,
                        name: 'PAN Number',
                      ),
                ),

                SizedBox(height: 20),

                MyCustomTextFormField(
                  controller: controller.propertyNumberController,
                  labelText: 'Property Number',
                  hintText: 'Enter property identification number',
                  prefixIcon: Icons.home,
                  validator:
                      (value) => formController.validateNames(
                        value,
                        name: 'Property Number',
                      ),
                ),

                SizedBox(height: 20),

                MyCustomTextFormField(
                  controller: controller.gstNumberController,
                  labelText: 'GST Number',
                  hintText: 'Enter GST registration number',
                  prefixIcon: Icons.receipt_long,
                  validator:
                      (value) => formController.validateNames(
                        value,
                        name: 'GST Details',
                      ),
                ),
                //PropertyInformation
                PropertyInformation(),
                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(
                        () => UploadHotelImages(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 300),
                      );
                    }
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: Colors.white,
                  text: 'Continue to Upload Images',
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
