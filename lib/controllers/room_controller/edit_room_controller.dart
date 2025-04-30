import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';

class RoomEditingController extends GetxController {
  late TextEditingController roomAreaController;
  late TextEditingController roomTypeController;
  late TextEditingController propertySizeController;
  late TextEditingController extraBedTypesController;
  late TextEditingController basePriceController;
  late TextEditingController extraAdultsController;
  late TextEditingController extraChildController;

  final RoomController _roomController = Get.find<RoomController>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();

    roomAreaController = TextEditingController();
    roomTypeController = TextEditingController();
    propertySizeController = TextEditingController();
    extraBedTypesController = TextEditingController();
    basePriceController = TextEditingController();
    extraAdultsController = TextEditingController();
    extraChildController = TextEditingController();
  }

  void initializeControllers(RoomModel roomData) {
    roomAreaController.text = roomData.roomArea;
    // roomTypeController.text = roomData.roomType;
    propertySizeController.text = roomData.propertySize.toString();
    extraBedTypesController.text = roomData.selectExtraBedTypes.toString();
    basePriceController.text = roomData.basePrice.toString();
    // extraAdultsController.text = roomData.numberOfExtraAdultsAllowed.toString();
    // extraChildController.text = roomData.numberOfExtraChildAllowed.toString();
  }

  Future<void> updateRoom(String roomId) async {
    // Show progress dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Prepare updated data
      Map<String, dynamic> updatedData = {
        'room_area': roomAreaController.text,
        'room_type': roomTypeController.text,
        'Property Size': int.tryParse(propertySizeController.text) ?? 0,
        'Select Extra Bed Types':
            int.tryParse(extraBedTypesController.text) ?? 0,
        'Base Price': int.tryParse(basePriceController.text) ?? 0,
        'Number of Extra Adults Allowed':
            int.tryParse(extraAdultsController.text) ?? 0,
        'Number of Extra Child Allowed':
            int.tryParse(extraChildController.text) ?? 0,
      };

      // Update Firestore
      await _updateRoomInFirestore(roomId, updatedData);

      // Close progress dialog
      if (Get.isDialogOpen == true) Get.back();

      // Show success message
      Get.snackbar(
        "Success",
        "Room details updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      // Refresh the room list
      await _roomController.getRooms();

      // Navigate back immediately instead of waiting
      Get.back();
    } catch (e) {
      // Close progress dialog in case of error
      if (Get.isDialogOpen == true) Get.back();

      Get.snackbar(
        "Error",
        "Failed to update room: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _updateRoomInFirestore(
    String roomId,
    Map<String, dynamic> updatedData,
  ) async {
    final uid = _roomController.uid;
    if (uid == null) {
      throw Exception("User not logged in");
    }

    await _firestore
        .collection('hotels')
        .doc(uid)
        .collection('rooms')
        .doc(roomId)
        .update(updatedData);
  }

  @override
  void onClose() {
    // Dispose of controllers
    roomAreaController.dispose();
    roomTypeController.dispose();
    propertySizeController.dispose();
    extraBedTypesController.dispose();
    basePriceController.dispose();
    extraAdultsController.dispose();
    extraChildController.dispose();
    super.onClose();
  }
}
