import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/final_review.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/add_image.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/mybottomsheet.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class UploadHotelImages extends StatefulWidget {
  const UploadHotelImages({super.key});

  @override
  State<UploadHotelImages> createState() => _UploadHotelImagesState();
}

class _UploadHotelImagesState extends State<UploadHotelImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Upload Hotel Images',
        icon: Icons.image_rounded,
      ),
      body: SingleChildScrollView(child: Column(children: [AddImagesMain()])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyCustomButton(
          width: 300,
          onPressed: () {
            Get.to(() => FinalReview(), transition: Transition.rightToLeft);
          },
          backgroundcolor: AppColors.primary,
          textcolor: AppColors.white,
          text: 'Next',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(MyBottomSheet());
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
