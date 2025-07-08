import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_details_controllers/room_detail_image_list_controller.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/room_detail_page/widgets/room_image_dialog.dart';

class RoomDetailListImages extends StatelessWidget {
  const RoomDetailListImages({super.key, required this.roomData});

  final RoomModel roomData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoomDetailImageController());

    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: roomData.roomImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                controller.setInitialData(
                  index: index,
                  images: roomData.roomImages,
                );
                showDialog(
                  context: context,
                  builder: (context) => const ImageDialog(),
                );
              },

              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.grey300, width: 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withAlpha((0.1 * 255).toInt()),
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.network(
                    roomData.roomImages[index],
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: AppColors.grey300,
                          child: Icon(
                            Icons.broken_image,
                            color: AppColors.grey,
                          ),
                        ),
                    loadingBuilder:
                        (context, child, progress) =>
                            progress == null
                                ? child
                                : Center(
                                  child: CircularProgressIndicator(
                                    value:
                                        progress.expectedTotalBytes != null
                                            ? progress.cumulativeBytesLoaded /
                                                progress.expectedTotalBytes!
                                            : null,
                                    color: AppColors.primary,
                                  ),
                                ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
