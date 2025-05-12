import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/add_room_final_amenities.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/add_room_final_basic_info.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/add_room_final_capacity_pricing.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/add_room_final_facilities.dart';

class EditRoomCard extends StatelessWidget {
  const EditRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final roomController = Get.find<RoomControllerNew>();
    final MyAppValidators myAppValidators = MyAppValidators();
    final RoomConstants roomConstants = RoomConstants();
    return SingleChildScrollView(
      child: Column(
        children: [
          RoomBasicInfo(
            roomController: roomController,
            roomConstants: roomConstants,
            myAppValidators: myAppValidators,
          ),
          RoomCapacityPricing(
            roomController: roomController,
            myAppValidators: myAppValidators,
          ),
          RoomFacilities(
            roomConstants: roomConstants,
            roomController: roomController,
          ),
          RoomAmenities(
            roomConstants: roomConstants,
            roomController: roomController,
          ),
        ],
      ),
    );
  }
}
