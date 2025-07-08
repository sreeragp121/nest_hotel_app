import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/detail_card.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class FinalReviewScreenMain extends StatelessWidget {
  const FinalReviewScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();

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
                RegistrationProgressIndicator(flex1: 7, flex2: 0),
                //DetailFinalReview
                const DetailFinalReviewCard(),

                const SizedBox(height: 24),
                MyCustomButton(
                  width: double.infinity,
                  onPressed: () {
                    controller.submit();
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
