import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/upload_image.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class FinanceLegalScreen extends StatelessWidget {
  const FinanceLegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    final formController = Get.find<MyTextfieldController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RegistrationAppBar(
        title: 'Finance & Legal',
        icon: Icons.description,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF8F9FA)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Header section
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Please provide accurate financial and legal information for your property registration.',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // Financial information section
                  Text(
                    'Tax Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 20),

                  _buildTextField(
                    controller: controller.panNumberController,
                    label: 'PAN Number',
                    hintText: 'Enter your PAN number',
                    prefixIcon: Icons.credit_card,
                    validator:
                        (value) => formController.validateNames(
                          value,
                          name: 'PAN Number',
                        ),
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 10,
                  ),

                  SizedBox(height: 20),

                  _buildTextField(
                    controller: controller.propertyNumberController,
                    label: 'Property Number',
                    hintText: 'Enter property identification number',
                    prefixIcon: Icons.home,
                    validator:
                        (value) => formController.validateNames(
                          value,
                          name: 'Property Number',
                        ),
                  ),

                  SizedBox(height: 20),

                  _buildTextField(
                    controller: controller.gstNumberController,
                    label: 'GST Number',
                    hintText: 'Enter GST registration number',
                    prefixIcon: Icons.receipt_long,
                    validator:
                        (value) => formController.validateNames(
                          value,
                          name: 'GST Details',
                        ),
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 15,
                  ),

                  SizedBox(height: 30),

                  // Property information section
                  Text(
                    'Property Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Property ownership selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Is your property owned or leased?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Obx(
                        () => Row(
                          children: [
                            _buildSelectionCard(
                              title: 'Owned',
                              icon: Icons.home_work,
                              isSelected:
                                  controller.propertyType.value == 'Owned',
                              onTap: () => controller.setPropertyType('Owned'),
                            ),
                            SizedBox(width: 16),
                            _buildSelectionCard(
                              title: 'Leased',
                              icon: Icons.description_outlined,
                              isSelected:
                                  controller.propertyType.value == 'Leased',
                              onTap: () => controller.setPropertyType('Leased'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Registration selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do you have property registration?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Obx(
                        () => Row(
                          children: [
                            _buildSelectionCard(
                              title: 'Yes',
                              icon: Icons.check_circle_outline,
                              isSelected:
                                  controller.hasRegistration.value == 'Yes',
                              onTap: () => controller.setRegistration('Yes'),
                            ),
                            SizedBox(width: 16),
                            _buildSelectionCard(
                              title: 'No',
                              icon: Icons.cancel_outlined,
                              isSelected:
                                  controller.hasRegistration.value == 'No',
                              onTap: () => controller.setRegistration('No'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  // Next button
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData prefixIcon,
    required String? Function(String?) validator,
    TextCapitalization textCapitalization = TextCapitalization.none,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
              prefixIcon: Icon(prefixIcon, color: AppColors.primary, size: 20),
              counterText: '',
              contentPadding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red.shade400, width: 1),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ]
                    : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
