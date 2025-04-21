import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
// import 'package:nest_hotel_app/controllers/registration_controllers/profile_data_controller.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  final profileDataController = 
  Get.find<ProfileDataController>
  ();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
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

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF355E57), Color(0xFFD7CCC8)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white),
                      onPressed: showLogoutDialog,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                profileDataController.profileData.value!.profileImage
                    .toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
