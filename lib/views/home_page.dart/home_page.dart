import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    void showLogoutDialog() {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    authController.logout();
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          InkWell(
            onTap: showLogoutDialog,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
