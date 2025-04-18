import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/detail_card.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class FinalReview extends StatelessWidget {
  const FinalReview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Column(
          children: [
            Text(
              'Final Review',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }
}
