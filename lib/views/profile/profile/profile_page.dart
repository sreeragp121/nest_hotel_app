import 'package:flutter/material.dart';
import 'package:nest_hotel_app/views/profile/profile/profile_card.dart';
import 'package:nest_hotel_app/views/profile/profile/profile_header.dart';
import 'package:nest_hotel_app/views/profile/profile/profile_name.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              ProfileName(),
              ProfileCard(),
              // EditProfileSection()
            ],
          ),
        ),
      ),
    );
  }
}
