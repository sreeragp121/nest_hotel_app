import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/rooms/room_card/room_card_details.dart';
import 'package:nest_hotel_app/views/rooms/room_card/room_card_image.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/room_detail_view_main.dart';

class RoomCardWidget extends StatelessWidget {
  final int index;
  const RoomCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final room = roomController.roomList[index];

    return Hero(
      tag: 'room_${room.roomName}_$index',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withAlpha(60),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Get.to(RoomDetailPage(index: index,));
            },
            splashColor: AppColors.primary.withAlpha(50),
            highlightColor: AppColors.primary.withAlpha(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room Image Section
                RoomCardImage(room: room),

                // Room Details Section
                RoomCardDetailSection(room: room),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
