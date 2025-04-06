import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/auths/forgot_password/forgot_password_page.dart';
import 'package:nest_hotel_app/views/auths/signup_page/sign_up_screen.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class LoginPageEmailAuth extends StatelessWidget {
  const LoginPageEmailAuth({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final AuthController authController = Get.put(AuthController());
    final formController = Get.find<MyTextfieldController>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'E-Mail ID',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          MyCustomTextFormField(
            controller: emailController,
            prefixIcon: const Icon(Icons.email),
            labelText: 'Email',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: formController.validateEmail,
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          MyCustomTextFormField(
            controller: passwordController,
            labelText: 'Password',
            prefixIcon: const Icon(Icons.password),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: formController.validatePassword,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text(
                ' Forgot Password?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 40),
          MyCustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authController.loginAccount(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              } else {
                null;
              }
            },
            backgroundcolor: AppColors.primary,
            textcolor: AppColors.white,
            text: 'LogIn',
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MySignUpPage()),
              );
            },
            child: const Text(
              'Don’t have an account? Sign up',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
