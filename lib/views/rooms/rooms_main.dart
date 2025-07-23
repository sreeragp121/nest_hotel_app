import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/add_room_details.main.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_page_main.dart';
import 'package:nest_hotel_app/views/rooms/room_card/room_card_main.dart';

class RoomsMain extends StatelessWidget {
  const RoomsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.put(RoomControllerNew());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hotel, size: 24, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Room Management',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              'Manage your hotel rooms efficiently',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.7 * 255).toInt()),
              ),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Obx(() {
        if (roomController.roomList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hotel_outlined,
                  size: 80,
                  color: AppColors.primary.withAlpha((0.5 * 255).toInt()),
                ),
                const SizedBox(height: 16),
                Text(
                  'No Rooms Available',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first room',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: roomController.roomList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(RoomDetailPageMain(index: index)),
                child: RoomCardWidget(index: index),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        onPressed: () {
          Get.to(() => AddRoomDetailMain());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
