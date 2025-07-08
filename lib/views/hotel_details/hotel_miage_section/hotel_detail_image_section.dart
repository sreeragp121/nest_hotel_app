import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_miage_section/image_carousel.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_miage_section/indicator_and_info.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_miage_section/top_controls.dart';

class HotelDetailsImageSection extends StatelessWidget {
  const HotelDetailsImageSection({super.key, required this.hotelData});
  final HotelModel hotelData;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha((0.3 * 255).toInt()),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        child: Stack(
          children: [
            ImageCarousel(pageController: pageController, hotelData: hotelData),
            TopControls(
              fadeAnimation: const AlwaysStoppedAnimation(1.0),
              hotelData: hotelData,
            ),
            IndicatorAndInfo(
              fadeAnimation: const AlwaysStoppedAnimation(1.0),
              slideAnimation: const AlwaysStoppedAnimation(Offset.zero),
              pageController: pageController,
              hotelData: hotelData,
            ),
          ],
        ),
      ),
    );
  }
}
