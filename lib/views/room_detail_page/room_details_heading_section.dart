import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_list_images.dart';
import 'package:readmore/readmore.dart';

class RoomDetailsHeading extends StatelessWidget {
  final int index;
  const RoomDetailsHeading({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final RoomModel roomData = roomController.roomList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          roomData.roomName,
          style: TextStyle(
            fontSize: 22,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Room Type',
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(color: AppColors.grey600),
        ),
        const SizedBox(height: 4.0),
        Obx(
          () => Text(
            roomController.roomList[index].roomType,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () => Text(
            roomController.roomList[index].roomTypeDescription,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        RoomDetailListImages(roomData: roomData),
        SizedBox(height: 16),
        Text(
          'Room Summary',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ReadMoreText(
          roomData.roomDescription,
          trimLines: 3,
          colorClickableText: AppColors.primary,
          trimMode: TrimMode.Line,
          trimCollapsedText: '...See more',
          trimExpandedText: ' See less',
          style: TextStyle(fontSize: 16),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}