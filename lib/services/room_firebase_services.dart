import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';

class RoomFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<List<String>> uploadRoomImages(List<File> images) async {
    final List<String> uploadedUrls = [];

    if (images.isEmpty) {
      return uploadedUrls;
    }

    int successCount = 0;

    for (int i = 0; i < images.length; i++) {
      try {
        final uniqueFileName =
            '${uid}_${DateTime.now().millisecondsSinceEpoch}_$i';
        final ref = _storage.ref().child('room_images/$uniqueFileName');

        // Upload the image
        final uploadTask = ref.putFile(images[i]);
        final snapshot = await uploadTask.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();

        uploadedUrls.add(url);
        successCount++;
      } catch (e) {
        MyCustomSnackBar.show(
          title: "Image Upload Error",
          message: "Failed to upload image ${i + 1}: $e",
          backgroundColor: AppColors.red,
        );
      }
    }

    if (successCount > 0) {
      MyCustomSnackBar.show(
        title: "Success",
        message: "Successfully uploaded $successCount images",
        backgroundColor: AppColors.green,
      );
    }

    return uploadedUrls;
  }


    Future<void> addRoomData(RoomModel roomData) async {
    try {
      if (uid == null) {
        MyCustomSnackBar.show(
          title: "Error",
          message: "User not logged in",
          backgroundColor: AppColors.red,
        );
        return;
      }

      await _firestore
          .collection('hotels')
          .doc(uid)
          .collection('room_data')
          .doc()
          .set(roomData.toJson());
      MyCustomSnackBar.show(
        title: "Success",
        message: "Hotel data added successfully",
        backgroundColor: AppColors.green,
      );
    } catch (e) {
      MyCustomSnackBar.show(
        title: "Error",
        message: "Failed to add hotel data: $e",
        backgroundColor: AppColors.red,
      );
    }
  }
}
