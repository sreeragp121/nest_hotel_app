import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController extends GetxController {
  var images = <File>[].obs;

  Future pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      images.add(file);
    }
  }

  Future pickImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      images.add(file);
    }
  }
}
