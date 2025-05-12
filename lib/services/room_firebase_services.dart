import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

      // 1. Create document reference
      final docRef =
          _firestore
              .collection('hotels')
              .doc(uid)
              .collection('room_data')
              .doc();

      // 2. Convert roomData to JSON
      final roomJson = roomData.toJson();

      // 3. Add the generated doc ID to the JSON
      roomJson['roomId'] = docRef.id;

      // 4. Save to Firebase
      await docRef.set(roomJson);

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

  Stream<List<RoomModel>> streamRooms() {
    if (uid == null) return const Stream.empty();

    return _firestore
        .collection('hotels')
        .doc(uid)
        .collection('room_data')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => RoomModel.fromJson(doc.data()))
              .toList();
        });
  }

  // Add this method to your RoomFirebaseServices class
  Future<void> updateRoomData(String roomId, RoomModel roomData) async {
    try {
      await FirebaseFirestore.instance
          .collection('hotels')
          .doc(uid)
          .collection('room_data')
          .doc(roomId)
          .update(roomData.toJson());
    } catch (e) {
      log('Error updating room: $e');
    }
  }

    Future<void> deleteRoom(String roomId) async {
    try {
      if (uid == null) {
        Get.snackbar("Error", "User not logged in");
        return;
      }

      log('Attempting to delete room: $roomId');

      await _firestore
          .collection('hotels')
          .doc(uid)
          .collection('room_data')
          .doc(roomId)
          .delete();

      log('Room deleted successfully: $roomId');


      Get.snackbar(
        "Success",
        "Room deleted successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log('Error deleting room: ${e.toString()}');
      Get.snackbar(
        "Error",
        "Failed to delete room: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
