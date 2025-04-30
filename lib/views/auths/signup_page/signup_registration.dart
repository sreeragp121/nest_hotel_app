import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class SignupRegistration extends StatelessWidget {
  const SignupRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final AuthController authController = Get.find<AuthController>();
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
            prefixIcon: Icons.email,
            labelText: 'Email',
            hintText: 'Enter Email',
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
            hintText: 'Enter password',
            prefixIcon: Icons.password,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: formController.validatePassword,
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Re Enter Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          MyCustomTextFormField(
            controller: repasswordController,
            labelText: 'Password',
            hintText: 'Enter Password',
            prefixIcon:Icons.password,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: formController.validatePassword,
          ),
          const SizedBox(height: 30),
          MyCustomButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (passwordController.text.trim() ==
                    repasswordController.text.trim()) {
                  String? success = await authController.createAccount(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  if (success != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.green,
                        content: Text('Account Created Successfully'),
                      ),
                    );

                    Get.offAll(
                      () => const LogInPageMain(),
                    ); // Navigate to login page
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.red,
                        content: Text('Account creation failed. Try again.'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text('Passwords do not match'),
                    ),
                  );
                }
              }
            },
            backgroundcolor: AppColors.primary,
            textcolor: AppColors.white,
            text: 'SignUp',
          ),
        ],
      ),
    );
  }
}
