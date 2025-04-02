import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/registration_pages/final_verification.dart/final_verification_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/finanace_legal_screen_main.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/add_image.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/mybottomsheet.dart';
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
      appBar: AppBar(title: Text('Upload Hotel Image'), centerTitle: true),
      body: SingleChildScrollView(child: Column(children: [AddImagesMain()])),
      floatingActionButton: Row(
        children: [
          SizedBox(width: 40),
          MyCustomButton(
            width: 300,
            onPressed: () {
              Get.to(()=>FinalVerificationPage());
            },
            backgroundcolor: AppColors.primary,
            textcolor: AppColors.white,
            text: 'Next',
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(MyBottomSheet());
            },
            backgroundColor: AppColors.primary,
            child: Icon(Icons.add, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
