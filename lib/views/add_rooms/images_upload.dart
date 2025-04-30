// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/room_final_review.dart';
import 'package:nest_hotel_app/widgets/alert_box.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class RoomImageUploadPage extends StatelessWidget {
  const RoomImageUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomController roomController = Get.find<RoomController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Upload Room Images',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Container(
        color: AppColors.grey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            if (roomController.roomImages.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No images added yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => GridView.builder(
                      itemCount: roomController.roomImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        File image = roomController.roomImages[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.file(image, fit: BoxFit.cover),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.black,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: AppColors.red,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        roomController.removeRoomImage(index);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (roomController.roomImages.isNotEmpty)
                    MyCustomButton(
                      text: "Continue to Review",
                      onPressed: () async {
                        final success = await roomController.uploadRoomImages();
                        if (success) {
                          Get.to(RoomsSubmissionPage());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to upload images'),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        }
                      },
                      backgroundcolor: AppColors.primary,
                      textcolor: AppColors.white,

                      width: double.infinity,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          roomController.roomImages.length < 10
              ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomAlertDialog(
                        contentText: 'Choose how you want to add images',
                        titleText: 'Add Images',
                        buttonText1: 'Camera',
                        buttonText2: 'Gallery',
                        onPressButton1: () async {
                          await roomController.captureRoomImage();
                          Navigator.of(context).pop();
                        },
                        onPressButton2: () async {
                          await roomController.pickRoomImages();
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.add_a_photo, color: AppColors.white),
              )
              : null,
    );
  }
}
