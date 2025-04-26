import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(
                      Icons.lock_reset,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                const Text(
                  'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                MyCustomTextFormField(
                  controller: emailController,
                  prefixIcon:  Icons.email,
                  labelText: 'Email',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                MyCustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await authController.resetPassword(
                          emailController.text,
                        );
                        Get.snackbar(
                          "Success",
                          "Password reset email sent! Check your inbox.",
                          backgroundColor: AppColors.green,
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        Get.snackbar(
                          "Error",
                          "Failed to send reset email: ${e.toString()}",
                          backgroundColor: AppColors.red,
                        );
                      }
                    }
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.background,
                  text: 'Submit',
                ),
                const SizedBox(height: 16),
                // Return to login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
