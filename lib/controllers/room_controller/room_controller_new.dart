import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RoomControllerNew extends GetxController {
  var roomType = ''.obs;
  final roomAreaController = TextEditingController();
  final roomSizeController = TextEditingController();
  final numberOfAdultsAllowed = TextEditingController();
  final numberOfChildAllowed = TextEditingController();
  final basePrice = TextEditingController();
  var extraBed = false.obs;
  var cupboard = false.obs;
  var wardrobe = false.obs;
  var freeBreakfast = false.obs;
  var freeLunch = false.obs;
  var freeDinner = false.obs;
  var laundry = false.obs;
  var elevator = false.obs;
  var swimmingPool = false.obs;
  var airConditioner = false.obs;
  var houseKeeping = false.obs;
  final kitchen = false.obs;
  final wifi = false.obs;
  var parking = false.obs;
  final List<String> imageUrl = [];

  void selectExtraBed() {
    extraBed.value = !extraBed.value;
  }

  void selectCupboard() {
    cupboard.value = !cupboard.value;
  }

  void selectWardrobe() {
    wardrobe.value = !wardrobe.value;
  }

  void selectFreeBreakfast() {
    freeBreakfast.value = !freeBreakfast.value;
  }

  void selectFreeLunch() {
    freeLunch.value = !freeLunch.value;
  }

  void selectFreeDinner() {
    freeDinner.value = !freeDinner.value;
  }

  void selectLaundry() {
    laundry.value = !laundry.value;
  }

  void selectElevator() {
    elevator.value = !elevator.value;
  }

  void selectSwimmingPool() {
    swimmingPool.value = !swimmingPool.value;
  }

  void selectAirConditioner() {
    airConditioner.value = !airConditioner.value;
  }

  void selectHouseKeeping() {
    houseKeeping.value = !houseKeeping.value;
  }

  void selectKitchen() {
    kitchen.value = !kitchen.value;
  }

  void selectWifi() {
    wifi.value = !wifi.value;
  }

  void selectParking() {
    parking.value = !parking.value;
  }

  void selectRoomType(String value) {
    roomType.value = value;
  }
}
