import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
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
  final checkInTimeController = TextEditingController();
  final checkOutTimeController = TextEditingController();

  // Meta
  final List<String> roomImages = [];
  final createdAt = ''.obs;
  final status = ''.obs;
  final List<String> tags = [];
  final checkInTime = ''.obs;
  final checkOutTime = ''.obs;

  RxMap<String, dynamic> roomFacilitysList =
      {
        "Cupboard": false,
        "Wardrobe": false,
        "Free Breakfast": false,
        "Free Lunch": false,
        "Free Dinner": false,
        "Laundry": false,
        "Elevator": false,
        "Air Conditioner": false,
        "House Keeping": false,
        "Kitchen": false,
        "Wifi": false,
        "Parking": false,
        "Swimming Pool": false,
        "Smoking Allowed": false,
        "Pets Allowed": false,
      }.obs;
  var editPageReadOnly = true.obs;
  //--------------edit page read oly text form field-------------------
  void changeReadonly() {
    editPageReadOnly.value = !editPageReadOnly.value;
    update();
  }

  void selectRoomType(RoomTypeListModel value) {
    roomType.value = value.roomTypeName;
    roomTypeDiscription.value = value.roomTypeDiscription;
  }

  void selectBedType(String value) {
    bedType.value = value;
  }

  void updateRoomFacilitys(String field, dynamic value) {
    roomFacilitysList[field] = value;
    roomFacilitysList.refresh();
  }

  void submissionRoom() {
    final roomData = RoomModel(
      roomName: roomNameController.text,
      roomType: RoomTypeListModel(
        roomTypeName: roomType.value,
        roomTypeDiscription: roomTypeDiscription.value,
      ),
      roomArea: roomAreaController.text,
      propertySize: propertySizeController.text,
      bedType: bedType.value,
      numberOfBeds: numberOfBedsController.text,
      maxAdults: maxAdultsController.text,
      maxChildren: maxChildrenController.text,
      selectExtraBedTypes: selectExtraBedTypesController.text,
      basePrice: basePriceController.text,
      freeBreakfast: roomFacilitysList['Free Breakfast'],
      freeLunch: roomFacilitysList['Free Lunch'],
      freeDinner: roomFacilitysList['Free Dinner'],
      cupboard: roomFacilitysList['Cupboard'],
      wardrobe: roomFacilitysList['Wardrobe'],
      laundry: roomFacilitysList['Laundry'],
      elevator: roomFacilitysList['Elevator'],
      airConditioner: roomFacilitysList['Air Conditioner'],
      houseKeeping: roomFacilitysList['House Keeping'],
      kitchen: roomFacilitysList['Kitchen'],
      wifi: roomFacilitysList['Wifi'],
      parking: roomFacilitysList['Parking'],
      swimmingPool: roomFacilitysList['Swimming Pool'],
      smokingAllowed: roomFacilitysList['Smoking Allowed'],
      petsAllowed: roomFacilitysList['Pets Allowed'],
      roomImages: roomImages,
      createdAt:
          '', // You can populate this with DateTime.now().toString() if needed
      tags: tags,
      checkInTime: checkInTimeController.text,
      checkOutTime: checkOutTimeController.text,
    );

    log(
      roomData.petsAllowed.toString(),
    ); // You may want to override toString in RoomModel for cleaner logging
  }
}
