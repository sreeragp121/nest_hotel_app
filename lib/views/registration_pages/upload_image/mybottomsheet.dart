import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({super.key});
  final AddImageController controller = Get.put(AddImageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColors.white,
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Choos Profile Photo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        log('pickImage');
                        await controller.pickImageFromCamera();
                        Get.back();
                      },
                      icon: const Icon(Icons.camera, size: 70.0),
                    ),
                    const Text('CAMERA', style: TextStyle()),
                  ],
                ),
              ),
              const SizedBox(width: 70),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.pickImageFromGallery();
                        Get.back();
                      },
                      icon: const Icon(Icons.photo, size: 70.0),
                    ),
                    const Text('GALLERY', style: TextStyle()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
