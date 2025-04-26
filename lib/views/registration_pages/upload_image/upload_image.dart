import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/final_review_screen.main.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/add_image.dart';
import 'package:nest_hotel_app/views/registration_pages/upload_image/mybottomsheet.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';

class UploadHotelImages extends StatefulWidget {
  const UploadHotelImages({super.key});

  @override
  State<UploadHotelImages> createState() => _UploadHotelImagesState();
}

class _UploadHotelImagesState extends State<UploadHotelImages> {
  final AddImageController controller = Get.put(AddImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Upload Hotel Images',
        leadingIcon: Icons.image_rounded,
      ),
      body: SingleChildScrollView(child: Column(children: [AddImagesMain()])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyCustomButton(
          width: 300,
          onPressed: () {
            (controller.images.isEmpty)
                ? MyCustomSnackBar.show(
                  title: 'No Image Selected',
                  message: 'Please add at least one image to continue.',
                  icon: Icons.error_outline,
                  backgroundColor: AppColors.red,
                  duration: Duration(seconds: 3)
                )
                : Get.to(
                  () => FinalReviewScreenMain(),
                  transition: Transition.rightToLeft,
                );
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
