// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
// import 'package:nest_hotel_app/views/profile/profile/profile_card.dart';
// import 'package:nest_hotel_app/views/profile/profile/profile_edit_button.dart';
// import 'package:nest_hotel_app/views/profile/profile/profile_header.dart';
// import 'package:nest_hotel_app/views/profile/profile/profile_name.dart';

// class UserProfileScreen extends StatelessWidget {
//   const UserProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ProfileDataController profileDataController =
//         Get.find<ProfileDataController>();

//     profileDataController.listenToVerificationStatus();
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ProfileHeader(),
//               ProfileName(),
//               ProfileCard(),
//               EditProfileSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
