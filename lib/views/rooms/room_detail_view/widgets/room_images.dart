import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';

class RoomDetailsImage extends StatelessWidget {
  final RoomControllerNew roomController;
  final int index;
  const RoomDetailsImage({
    super.key,
    required this.roomController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final RoomModel roomData = roomController.roomList[index];
    return Stack(
      children: [
        Container(
          child:
              roomData.roomImages.isNotEmpty
                  ? Image.network(
                    roomData.roomImages.first,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                  : Container(
                    height: 400,
                    width: double.infinity,
                    color: AppColors.grey.withAlpha((.5 * 225).toInt()),
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: AppColors.grey600,
                    ),
                  ),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white.withAlpha((.5 * 225).toInt()),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.white),
              ),
              child: Center(
                child: Transform.translate(
                  offset: Offset(3, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white.withAlpha((.5 * 225).toInt()),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.white),
              ),
              child: Center(
                child: Icon(Icons.more_vert, color: AppColors.white, size: 25),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(color: AppColors.white, child: Text('data')),
        ),
      ],
    );
  }
}
