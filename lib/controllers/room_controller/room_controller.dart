import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nest_hotel_app/models/room_model.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';

class RoomController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    super.onInit();
    getRooms();
  }

  RxMap<String, dynamic> roomData =
      {
        "room_area": '',
        "room_type": '',
        "Property Size": 0,
        "Select Extra Bed Types": 0,
        "Cupboard": false,
        "Wardrobe": false,
        "Free Breakfast": false,
        "Free Lunch": false,
        "Free Dinner": false,
        "Base Price": 0,
        "Number of Extra Adults Allowed": 0,
        "Number of Extra Child Allowed": 0,
        "Laundry": false,
        "Elevator": false,
        "Air Conditioner": false,
        "House Keeping": false,
        "Kitchen": false,
        "Wifi": false,
        "Parking": false,
        'room_images': [],
      }.obs;

  RxList<File> roomImages = <File>[].obs;
  RxList<String> roomImageUrls = <String>[].obs;
  RxList<RoomModel> roomList = <RoomModel>[].obs;

  RxBool isUploading = false.obs;
  String? hotelId;

  void updateRoomData(String field, dynamic value) {
    roomData[field] = value;
    roomData.refresh();
  }

  Future<void> pickRoomImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      roomImages.addAll(pickedFiles.map((file) => File(file.path)));
    }
  }

  Future<void> captureRoomImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      roomImages.add(File(pickedFile.path));
    }
  }

  void removeRoomImage(int index) {
    if (index >= 0 && index < roomImages.length) {
      roomImages.removeAt(index);
    }
  }

  Future<bool> uploadRoomImages() async {
    if (roomImages.isEmpty) return false;

    isUploading.value = true;
    try {
      for (var image in roomImages) {
        final ref = FirebaseStorage.instance.ref().child(
          'room_images/${DateTime.now().toIso8601String()}',
        );
        final uploadTask = ref.putFile(image);
        final snapshot = await uploadTask.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();
        roomImageUrls.add(url);
      }
      roomImages.clear();
      return true;
    } catch (e) {
      debugPrint('Error uploading room images: $e');
      return false;
    } finally {
      isUploading.value = false;
    }
  }

  void clearRoomImages() {
    roomImages.clear();
    roomImageUrls.clear();
  }

  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<void> submitRoom() async {
    try {
      if (uid == null) {
        Get.snackbar("Error", "User not logged in");
        return;
      }
      roomData['room_images'] = roomImageUrls;
      DocumentReference roomRef = await _firestore
          .collection('hotels')
          .doc(uid)
          .collection('rooms')
          .add(roomData);

      String roomId = roomRef.id;

      Map<String, dynamic> finalRoomData = {
        ...roomData,
        'roomId': roomId,
        'created_at': FieldValue.serverTimestamp().toString(),
        'status': 'nonbooked',
      };

      await roomRef.update(finalRoomData);
      roomData.clear();
      await getRooms();
      Get.snackbar(
        "Success",
        "room data added successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(MyNavigationBar());
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add roo data: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getRooms() async {
    try {
      if (uid == null) {
        Get.snackbar("Error", "User not logged in");
        return;
      }

      final snapshot =
          await _firestore
              .collection('hotels')
              .doc(uid)
              .collection('rooms')
              .get();

      log('Rooms fetched: ${snapshot.docs}');

      roomList.value =
          snapshot.docs.map((doc) => RoomModel.fromJson(doc.data())).toList();

      Get.snackbar(
        "Success",
        "Rooms loaded successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        "Error",
        "Failed to load rooms: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Drop-down
  RxString? roomsSelectedItem = RxString('');

  final List<String> roomsItems = [
    'Single Room',
    'Double Room',
    'Suite',
    'Deluxe',
    'Executive',
  ];

  void setRoomSelectedItem(String? value) {
    roomsSelectedItem?.value = value ?? '';
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
          .collection('rooms')
          .doc(roomId)
          .delete();

      log('Room deleted successfully: $roomId');

      await getRooms();

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
