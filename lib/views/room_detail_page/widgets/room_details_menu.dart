import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/edit_rooms/edit_room_main.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';
import 'package:nest_hotel_app/widgets/alert_box.dart';

class RoomDetailMenu extends StatelessWidget {
  final int index;
  const RoomDetailMenu({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final RoomModel roomData = roomController.roomList[index];
    
    return PopupMenuButton<String>(
      offset: const Offset(-10, 55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: AppColors.white.withAlpha((0.2 * 255).toInt()),
          width: 1,
        ),
      ),
      elevation: 0,
      color: AppColors.white.withAlpha((0.2 * 255).toInt()),
      icon: Container(
        padding: EdgeInsets.all(2),
        child: Icon(
          Icons.more_vert_rounded,
          color: AppColors.white,
          size: 22,
        ),
      ),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Edit Option
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                      await roomController.loadRoomData(roomData);
                      log(roomData.roomId.toString());

                      Get.to(EditRoomMain());
                    },
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primary.withAlpha((0.3 * 255).toInt()),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.edit_rounded,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Edit Room',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white.withAlpha((0.7 * 255).toInt()),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Divider
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.white,
                          AppColors.white.withAlpha((0.3 * 255).toInt()),
                          AppColors.white,
                        ],
                      ),
                    ),
                  ),
                  
                  // Delete Option
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.red.withAlpha(90),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.red.withAlpha(120),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.delete_rounded,
                              color: AppColors.red,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Delete Room',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white.withAlpha((0.7 * 255).toInt()),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}