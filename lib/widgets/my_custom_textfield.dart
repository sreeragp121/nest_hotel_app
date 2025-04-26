import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';

class MyCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? prefixText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final AutovalidateMode autovalidateMode;
  final int? maxlength;
  final bool readOnly;

  const MyCustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.maxlength,
    this.readOnly=false
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTextfieldController>(
      init: MyTextfieldController(),
      builder: (textfieldcontroller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (labelText != null && labelText!.isNotEmpty)
              Text(
                labelText!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black54,
                ),
              ),
            if (labelText != null && labelText!.isNotEmpty) SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withAlpha(13),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller,
                obscureText:
                    obscureText ? textfieldcontroller.obscureText : obscureText,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                validator: validator,
                onChanged: onChanged,
                maxLength: maxlength,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixText: prefixText,
                  hintText: hintText,
                  hintStyle: TextStyle(color: AppColors.black38, fontSize: 14),
                  prefixIcon: Icon(
                    prefixIcon,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  suffixIcon:
                      obscureText
                          ? IconButton(
                            onPressed:
                                textfieldcontroller.visibilityButtonClick,
                            icon:
                                textfieldcontroller.obscureText
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                          )
                          : null,
                  contentPadding:
                      contentPadding ??
                      const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 18.0,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.grey300, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.grey300, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.red, width: 1),
                  ),
                ),
                readOnly: readOnly,
              ),
            ),
          ],
        );
      },
    );
  }
}
