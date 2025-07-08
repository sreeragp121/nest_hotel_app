import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_details_controllers/room_detail_image_list_controller.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RoomDetailImageController>();
    final roomImages = controller.roomImages;

    if (roomImages.isEmpty) {
      return const Center(child: Text("No images available"));
    }
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.black.withAlpha((0.5*255).toInt()),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    'Image ${controller.currentIndex.value + 1} of ${roomImages.length}',
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // Swipeable images
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: AppColors.black,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: roomImages.length,
                onPageChanged: controller.updateIndex,
                itemBuilder: (_, index) {
                  return InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 3,
                    child: Image.network(
                      roomImages[index],
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder:
                          (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.error_outline,
                              color: AppColors.white,
                            ),
                          ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Navigation buttons
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.currentIndex.value > 0)
                  ElevatedButton(
                    onPressed: controller.previousPage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Icon(Icons.arrow_back, color: AppColors.white),
                  ),
                const SizedBox(width: 24),
                if (controller.currentIndex.value < roomImages.length - 1)
                  ElevatedButton(
                    onPressed: controller.nextPage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Icon(Icons.arrow_forward, color: AppColors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
