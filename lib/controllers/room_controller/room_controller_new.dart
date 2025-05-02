import 'dart:core';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/time_controller.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';
import 'package:nest_hotel_app/services/room_firebase_services.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';

class RoomControllerNew extends GetxController {
  final RoomFirebaseServices roomFirebaseServices = RoomFirebaseServices();
  final timeController = Get.find<TimeController>();

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
    roomTypeDiscription.value = value.roomTypeDescription;
  }

  void selectBedType(String value) {
    bedType.value = value;
  }

  void updateRoomFacilitys(String field, dynamic value) {
    roomFacilitysList[field] = value;
    roomFacilitysList.refresh();
  }

  Future<void> submitRoomData() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final images = Get.find<AddImageController>().images;
      final uploadedUrls = await roomFirebaseServices.uploadRoomImages(images);
      log(uploadedUrls.toString());
      if (uploadedUrls.isEmpty && images.isNotEmpty) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar(
          "Upload Failed",
          "Failed to upload images. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final roomData = RoomModel(
        roomName: roomNameController.text,
        roomType: roomType.value,
        roomTypeDescription: roomTypeDiscription.value,
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
        roomImages: uploadedUrls,
        createdAt: '',
        tags: tags,
        checkInTime: timeController.formatTime(
          timeController.checkInTime.value,
        ),
        checkOutTime: timeController.formatTime(
          timeController.checkOutTime.value,
        ),
      );

      await roomFirebaseServices.addRoomData(roomData);

      if (Get.isDialogOpen == true) Get.back();

      Get.snackbar(
        "Success",
        "Your property has been registered successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      Get.offAll(MyNavigationBar());
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      Get.snackbar(
        "Error",
        "Registration failed: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
