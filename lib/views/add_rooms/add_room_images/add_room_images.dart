import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';

class AddRoomImages extends StatelessWidget {
  AddRoomImages({super.key});

  final AddImageController controller = Get.find<AddImageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.images.isNotEmpty
          ? GridView.builder(
            padding: const EdgeInsets.all(12.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 1,
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withAlpha(38),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Image container with gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.transparent,
                            AppColors.black..withAlpha(26),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: 'hotel_image_$index',
                          child: Image.file(
                            controller.images[index],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Delete button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: () {
                            controller.images.removeAt(index);
                          },
                          customBorder: const CircleBorder(),
                          child: Ink(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.red.withAlpha(230),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withAlpha(51),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.close,
                                color: AppColors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Image number indicator
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withAlpha(153),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Image ${index + 1}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
          : Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.grey.withAlpha(77),
                width: 2,
              ),
              color: AppColors.grey.withAlpha(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 60,
                  color: AppColors.grey.withAlpha(179),
                ),
                const SizedBox(height: 16),
                Text(
                  'Add Hotel Images',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap + to upload photos',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey.withAlpha(179),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
