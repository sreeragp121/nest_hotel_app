import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/hotel_profile_controller.dart';

class EnhancedWelcomeCard extends StatelessWidget {
  const EnhancedWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HotelProfileController profileDataController = Get.put(
      HotelProfileController(),
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withAlpha(200),
              AppColors.primary.withAlpha(150),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Welcome Back,',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white,
                            height: 1.2,
                          ),
                        ),
                        Spacer(),
                        Obx(() {
                          if (profileDataController.profileData.value == null) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: CircularProgressIndicator(
                                  color: AppColors.background,
                                ),
                              ),
                            );
                          }
                          return VerificationCard(
                            status:
                                profileDataController
                                    .profileData
                                    .value!
                                    .verificationStatus,
                          );
                        }),
                      ],
                    ),
                    Obx(() {
                      if (profileDataController.profileData.value == null) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(
                              color: AppColors.background,
                            ),
                          ),
                        );
                      }
                      return Text(
                        profileDataController.profileData.value!.stayName,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      );
                    }),
                    const SizedBox(height: 12),
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                      // '28/10/25',
                      style: TextStyle(
                        color: AppColors.white.withAlpha((0.8 * 255).toInt()),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationCard extends StatelessWidget {
  final String status;
  const VerificationCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.green,
        border: Border.all(color: AppColors.background.withAlpha(200)),
        borderRadius: BorderRadius.circular(5),
      ),

      child: Text(status, style: TextStyle(color: AppColors.white,fontSize: 16 )),
    );
  }
}
