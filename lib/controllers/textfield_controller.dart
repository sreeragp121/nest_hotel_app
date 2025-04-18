import 'package:get/get.dart';

class MyTextfieldController extends GetxController {
  bool obscureText = true;

  visibilityButtonClick() {
    obscureText = !obscureText;
    update();
  }

  // Email Validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$',
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Phone Number Validator
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // OTP Validator
  String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (value.length != 6) {
      return 'Please enter a valid 6-digit OTP';
    }
    return null;
  }

  // Password Validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateNames(String? value, {required String name}) {
    if (value == null || value.isEmpty) {
      return 'Enter the $name';
    }
    return null;
  }
}
