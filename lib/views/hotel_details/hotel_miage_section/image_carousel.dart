import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';


class ImageCarousel extends StatelessWidget {
  final PageController pageController;
  final HotelModel hotelData;

  const ImageCarousel({super.key, required this.pageController, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: AppColors.grey,
      child: PageView.builder(
        controller: pageController,
        itemCount: hotelData.images.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: hotelData.images[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 50, color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparent,
                      AppColors.transparent,
                      AppColors.black.withAlpha((0.3 * 255).toInt()),
                      AppColors.black.withAlpha((0.7 * 255).toInt()),
                    ],
                    stops: const [0.0, 0.4, 0.7, 1.0],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
