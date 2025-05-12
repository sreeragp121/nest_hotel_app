import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/edit_rooms/edit_room_main.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';
import 'package:nest_hotel_app/widgets/alert_box.dart';

class RoomDetailMenu extends StatelessWidget {
  const RoomDetailMenu({
    super.key,
    required this.roomController,
    required this.roomData,
  });

  final RoomControllerNew roomController;
  final RoomModel roomData;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      icon: const Icon(Icons.more_vert),
      position: PopupMenuPosition.under,
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                await roomController.loadRoomData(roomData);
                Get.to(EditRoomMain());
              },
            ),
            PopupMenuItem<String>(
              height: 2,
              enabled: false,
              child: Divider(color: AppColors.grey, height: 2),
            ),
            PopupMenuItem<String>(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: AppColors.red,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        titleText: 'Delete Room',
                        contentText:
                            'Are you sure you want to delete this room? This action cannot be undone.',
                        buttonText1: 'Cancel',
                        buttonText2: 'Delete',
                        onPressButton1: () {
                          Get.back();
                        },
                        onPressButton2: () async {
                          log(roomData.roomId.toString());
                          await roomController.deleteRooms(roomData.roomId!);
                          Get.offAll(MyNavigationBar());
                        },
                      );
                    },
                  );
                });
              },
            ),
          ],
    );
  }
}
