import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';

class MyCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
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
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTextfieldController>(
      init: MyTextfieldController(),
      builder: (textfieldcontroller) {
        return TextFormField(
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
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: prefixIcon,
            suffixIcon:
                obscureText
                    ? IconButton(
                      onPressed: textfieldcontroller.visibilityButtonClick,
                      icon:
                          textfieldcontroller.obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                    )
                    : null,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: borderColor ?? AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: enabledBorderColor ?? AppColors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: errorBorderColor ?? Colors.red),
            ),
          ),
        );
      },
    );
  }
}
