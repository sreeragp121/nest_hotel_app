import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_images/add_image_card.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_images/add_room_images.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/room_final_review.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/room_final_review_main.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';

class AddRoomImagesMain extends StatefulWidget {
  const AddRoomImagesMain({super.key});

  @override
  State<AddRoomImagesMain> createState() => _AddRoomImagesMainState();
}

class _AddRoomImagesMainState extends State<AddRoomImagesMain> {
  final AddImageController controller = Get.put(AddImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Upload Room Images',
        leadingIcon: Icons.image_rounded,
      ),
      body: SingleChildScrollView(child: Column(children: [AddRoomImages()])),
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
                  duration: Duration(seconds: 3),
                )
                : Get.to(
                  () => AddRoomFinalReviewPageMain(),
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
          Get.bottomSheet(AddRoomImageBottomSheet());
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
