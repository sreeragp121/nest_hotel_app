import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';

class AddImageController extends GetxController {
  var images = <File>[].obs;

  Future pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      images.add(file);
      Get.find<RegistrationController>().images.add(file);
    }
  }

  Future pickImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      images.add(file);
      Get.find<RegistrationController>().images.add(file);
    }
  }

  bool imageValidate() {
    if (images.isEmpty) {
      Get.snackbar(
        'No Image',
        'Please select at least one image',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
