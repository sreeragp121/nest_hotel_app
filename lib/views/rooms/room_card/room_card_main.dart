import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';

class RoomCardWidget extends StatelessWidget {
  final int index;
  const RoomCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final room = roomController.roomList[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Image(
                  image: NetworkImage(room.roomImages[0]),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: AppColors.black.withAlpha(130),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                room.roomName,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                room.roomType,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bed_outlined,
                                color: AppColors.white.withAlpha(150),
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                room.roomTypeDescription,
                                style: TextStyle(
                                  color: AppColors.white.withAlpha(150),
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.door_front_door_outlined,
                                color: AppColors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${room.numberOfRooms} Rooms',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.square_foot,
                                color: AppColors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${room.roomArea} sqft',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₹ ${room.basePrice}/night',
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
