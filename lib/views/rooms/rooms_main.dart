import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/room_type/add_room_first_page.dart';
import 'package:nest_hotel_app/views/rooms/room_card.dart';

class RoomsMain extends StatelessWidget {
  const RoomsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomController roomController = Get.put(RoomController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text('Rooms'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: roomController.roomList.length,
          itemBuilder: (context, index) {
            return RoomCard(index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        onPressed: () {
          Get.to(() => AddRoomFirstPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
