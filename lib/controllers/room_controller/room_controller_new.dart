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
  @override
  void onInit() {
    super.onInit();
    listenToRoomStream();
  }

  final RoomFirebaseServices roomFirebaseServices = RoomFirebaseServices();
  final timeController = Get.find<TimeController>();

  // Basic Room Info
  final roomNameController = TextEditingController();
  final roomType = ''.obs;
  final roomTypeDiscription = ''.obs;
  final roomAreaController = TextEditingController();
  final bedType = ''.obs;
  final numberOfRoomsController = TextEditingController();
  final roomDescription = TextEditingController();

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
  var roomId = ''.obs;

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
        roomDescription: roomDescription.text,
        roomType: roomType.value,
        roomTypeDescription: roomTypeDiscription.value,
        roomArea: roomAreaController.text,
        bedType: bedType.value,
        numberOfRooms: numberOfRoomsController.text,
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
      clearAllFields();
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

  RxList<RoomModel> roomList = <RoomModel>[].obs;

  void listenToRoomStream() {
    roomFirebaseServices.streamRooms().listen((rooms) {
      roomList.value = rooms;
    });
  }

  // Add this method to your RoomControllerNew class
  void clearAllFields() {
    // Clear text controllers
    roomNameController.clear();
    roomAreaController.clear();
    numberOfRoomsController.clear();
    maxAdultsController.clear();
    maxChildrenController.clear();
    selectExtraBedTypesController.clear();
    basePriceController.clear();
    checkInTimeController.clear();
    checkOutTimeController.clear();
    roomDescription.clear();
    // Reset observable strings
    roomType.value = '';
    roomTypeDiscription.value = '';
    bedType.value = '';
    createdAt.value = '';
    status.value = '';
    checkInTime.value = '';
    checkOutTime.value = '';

    // Clear lists
    roomImages.clear();
    tags.clear();

    // Reset the facilities map
    roomFacilitysList.forEach((key, _) {
      roomFacilitysList[key] = false;
    });
    roomFacilitysList.refresh();

    // Reset any image controller if needed
    if (Get.isRegistered<AddImageController>()) {
      Get.find<AddImageController>().clearImages();
    }

    timeController.resetTimes();
    editPageReadOnly.value = true;

    update();
  }

  // Add this function to your RoomControllerNew class
  Future<void> updateRoomData(String roomId) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      List<String> updatedImageUrls = [...roomImages];

      final roomData = RoomModel(
        roomName: roomNameController.text,
        roomDescription: roomDescription.text,
        roomType: roomType.value,
        roomTypeDescription: roomTypeDiscription.value,
        roomArea: roomAreaController.text,
        roomId: roomId,
        bedType: bedType.value,
        numberOfRooms: numberOfRoomsController.text,
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
        roomImages: updatedImageUrls,
        createdAt: createdAt.value,
        tags: tags,
        checkInTime: checkInTime.value,
        checkOutTime: checkOutTime.value,
        status: status.value,
      );

      await roomFirebaseServices.updateRoomData(roomId, roomData);

      if (Get.isDialogOpen == true) Get.back();
      clearAllFields();
      Get.snackbar(
        "Success",
        "Room details updated successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      await Future.delayed(const Duration(milliseconds: 300));

      Get.offAll(MyNavigationBar());
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      Get.snackbar(
        "Error",
        "Update failed: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  loadRoomData(RoomModel room) {
    roomNameController.text = room.roomName;
    roomAreaController.text = room.roomArea;
    numberOfRoomsController.text = room.numberOfRooms;
    maxAdultsController.text = room.maxAdults;
    maxChildrenController.text = room.maxChildren;
    selectExtraBedTypesController.text = room.selectExtraBedTypes;
    basePriceController.text = room.basePrice;
    roomType.value = room.roomType;
    roomTypeDiscription.value = room.roomTypeDescription;
    bedType.value = room.bedType;
    createdAt.value = room.createdAt;
    checkInTime.value = room.checkInTime;
    checkOutTime.value = room.checkOutTime;
    roomId.value = room.roomId.toString();
    roomDescription.text = room.roomDescription;
    roomImages.clear();
    roomImages.addAll(room.roomImages);

    // Set tags
    tags.clear();
    tags.addAll(room.tags);

    // Set facilities
    roomFacilitysList['Free Breakfast'] = room.freeBreakfast;
    roomFacilitysList['Free Lunch'] = room.freeLunch;
    roomFacilitysList['Free Dinner'] = room.freeDinner;
    roomFacilitysList['Cupboard'] = room.cupboard;
    roomFacilitysList['Wardrobe'] = room.wardrobe;
    roomFacilitysList['Laundry'] = room.laundry;
    roomFacilitysList['Elevator'] = room.elevator;
    roomFacilitysList['Air Conditioner'] = room.airConditioner;
    roomFacilitysList['House Keeping'] = room.houseKeeping;
    roomFacilitysList['Kitchen'] = room.kitchen;
    roomFacilitysList['Wifi'] = room.wifi;
    roomFacilitysList['Parking'] = room.parking;
    roomFacilitysList['Swimming Pool'] = room.swimmingPool;
    roomFacilitysList['Smoking Allowed'] = room.smokingAllowed;
    roomFacilitysList['Pets Allowed'] = room.petsAllowed;

    roomFacilitysList.refresh();
    update();
  }

  Future deleteRooms(String roomId) async {
    await roomFirebaseServices.deleteRoom(roomId);
  }
}
