import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/views/hotel_detail_edits/hotel_detail_edit_main.dart';

class TopControls extends StatelessWidget {
  final HotelModel hotelData;
  final Animation<double> fadeAnimation;

  const TopControls({
    super.key,
    required this.fadeAnimation,
    required this.hotelData,
  });

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.put(RegistrationController());
    return FadeTransition(
      opacity: fadeAnimation,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: TopControlsIconCard(icon: Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                await registrationController.loadHotelData(hotelData);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailEditMain(),
                  ),
                );
              },
              child: TopControlsIconCard(icon: Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}

class TopControlsIconCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  const TopControlsIconCard({
    super.key,
    required this.icon,
    this.iconColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.black.withAlpha((0.4 * 255).toInt()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.white.withAlpha((0.2 * 255).toInt()),
          width: 1,
        ),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}
