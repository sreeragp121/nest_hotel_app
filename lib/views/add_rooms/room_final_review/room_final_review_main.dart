import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/add_room_final_review_card.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class AddRoomFinalReviewPageMain extends StatelessWidget {
  const AddRoomFinalReviewPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RoomControllerNew>();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Final Review Page',
        leadingIcon: Icons.checklist_rounded,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddRoomFinalReviewCard(),

                const SizedBox(height: 24),
                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    controller.submitRoomData();
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.white,
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
