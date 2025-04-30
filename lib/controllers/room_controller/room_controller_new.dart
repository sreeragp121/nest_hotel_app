import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';

class RoomControllerNew extends GetxController {
  // Basic Room Info
  final roomNameController = TextEditingController();
  final roomType = ''.obs;
  final roomTypeDiscription = ''.obs;
  final roomAreaController = TextEditingController();
  final propertySizeController = TextEditingController();
  final bedType = ''.obs;
  final numberOfBedsController = TextEditingController();

  // Capacity & Pricing
  final maxAdultsController = TextEditingController();
  final maxChildrenController = TextEditingController();
  final selectExtraBedTypesController = TextEditingController();
  final basePriceController = TextEditingController();

  // Meal Inclusion
  final freeBreakfast = false.obs;
  final freeLunch = false.obs;
  final freeDinner = false.obs;

  // Room Features
  final cupboard = false.obs;
  final wardrobe = false.obs;

  // Amenities
  final laundry = false.obs;
  final elevator = false.obs;
  final airConditioner = false.obs;
  final houseKeeping = false.obs;
  final kitchen = false.obs;
  final wifi = false.obs;
  final parking = false.obs;
  final swimmingPool = false.obs;

  // Policy
  final smokingAllowed = false.obs;
  final petsAllowed = false.obs;

  // Meta
  final List<String> roomImages = [];
  final createdAt = ''.obs;
  final status = ''.obs;
  final List<String> tags = [];
  final checkInTime = ''.obs;
  final checkOutTime = ''.obs;

  void toggleFreeBreakfast() => freeBreakfast.toggle();
  void toggleFreeLunch() => freeLunch.toggle();
  void toggleFreeDinner() => freeDinner.toggle();
  void toggleCupboard() => cupboard.toggle();
  void toggleWardrobe() => wardrobe.toggle();
  void toggleLaundry() => laundry.toggle();
  void toggleElevator() => elevator.toggle();
  void toggleAirConditioner() => airConditioner.toggle();
  void toggleHouseKeeping() => houseKeeping.toggle();
  void toggleKitchen() => kitchen.toggle();
  void toggleWifi() => wifi.toggle();
  void toggleParking() => parking.toggle();
  void toggleswimmingPool() => swimmingPool.toggle();
  void toggleSmokingAllowed() => smokingAllowed.toggle();
  void togglePetsAllowed() => petsAllowed.toggle();

  void selectRoomType(RoomTypeListModel value) {
    roomType.value = value.roomTypeName;
    roomTypeDiscription.value = value.roomTypeDiscription;
  }

  void selectBedType(String value) {
    bedType.value = value;
  }

  void updateRoomData(field, dynamic value) {
    field.value = value;
    // Triggers UI update
  }
}
