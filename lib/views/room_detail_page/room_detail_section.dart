import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_basic_info.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_feature_section.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_details_heading_section.dart';

class RoomDetailSection extends StatelessWidget {
  final int index;
  const RoomDetailSection({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final RoomModel roomData = roomController.roomList[index];

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // room detail heading
                  RoomDetailsHeading(index: index),
                  SizedBox(height: 15),
                  // room detail Basic information
                  RoomDetailBasicInfo(index: index),
                  SizedBox(height: 15),
                  // room details feature section
                  RoomDetailFeatureSection(
                    index: index,
                    roomController: roomController,
                    roomData: roomData,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
