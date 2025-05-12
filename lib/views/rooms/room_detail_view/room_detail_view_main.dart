import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/room_detail_card.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/widgets/room_details_menu.dart';

class RoomDetailPage extends StatelessWidget {
  final int index;
  const RoomDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final RoomModel roomData = roomController.roomList[index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          roomData.roomName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          RoomDetailMenu(roomController: roomController, roomData: roomData),
        ],
      ),
      body: RoomDetailCard(index: index, roomController: roomController),
    );
  }
}
