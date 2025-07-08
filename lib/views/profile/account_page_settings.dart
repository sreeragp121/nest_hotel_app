import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/auth_controller.dart';
import 'package:nest_hotel_app/views/profile/account_tile_card.dart';
import 'package:nest_hotel_app/views/profile/profile_page_main.dart';

class AccPageSettings extends StatelessWidget {
  const AccPageSettings({super.key});

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

    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          'Settings',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              TileSection(
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                leadicon: Icons.share,
                title: 'Share',
                subtitle: 'Share the app with friends',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
              TileSection(
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                leadicon: Icons.security,
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
              TileSection(
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                leadicon: Icons.file_copy,
                title: 'Terms&Conditions',
                subtitle: 'View terms of service',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
              TileSection(
                ontap: () => showLogoutDialog(),
                // ontap: () {},
                leadicon: Icons.logout,
                title: 'Logout',
                subtitle: 'Sign out of your Account',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
