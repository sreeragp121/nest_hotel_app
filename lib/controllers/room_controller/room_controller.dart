// import 'dart:developer';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nest_hotel_app/models/room_models/room_model.dart';
// import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';

// class RoomController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void onInit() {
//     super.onInit();
//     getRooms();
//   }

//   // Default room data structure with initial values
//   RxMap<String, dynamic> roomData =
//       {
//         "room_area": '',
//         "room_type": '',
//         "Property Size": 0,
//         "Select Extra Bed Types": 0,
//         "Cupboard": false,
//         "Wardrobe": false,
//         "Free Breakfast": false,
//         "Free Lunch": false,
//         "Free Dinner": false,
//         "Base Price": 0,
//         "Number of Extra Adults Allowed": 0,
//         "Number of Extra Child Allowed": 0,
//         "Laundry": false,
//         "Elevator": false,
//         "Air Conditioner": false,
//         "House Keeping": false,
//         "Kitchen": false,
//         "Wifi": false,
//         "Parking": false,
//         'room_images': [],
//       }.obs;

//   // Lists to store temporary room images as files and final image URLs
//   RxList<File> roomImages = <File>[].obs;
//   RxList<String> roomImageUrls = <String>[].obs;

//   // Stores the list of rooms retrieved from Firebase
//   RxList<RoomModel> roomList = <RoomModel>[].obs;

//   // Tracks the state of image upload process
//   RxBool isUploading = false.obs;

//   // Hotel ID for future use (currently not used in this code)
//   String? hotelId;

//   // Updates a specific field in the room data
//   void updateRoomData(String field, dynamic value) {
//     roomData[field] = value;
//     roomData.refresh(); // Triggers UI update
//   }

//   // Opens the gallery to select multiple room images
//   Future<void> pickRoomImages() async {
//     final pickedFiles = await ImagePicker().pickMultiImage();
//     if (pickedFiles.isNotEmpty) {
//       roomImages.addAll(pickedFiles.map((file) => File(file.path)));
//     }
//   }

//   // Opens the camera to capture a single room image
//   Future<void> captureRoomImage() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//     );
//     if (pickedFile != null) {
//       roomImages.add(File(pickedFile.path));
//     }
//   }

//   // Removes an image from the temporary list by index
//   void removeRoomImage(int index) {
//     if (index >= 0 && index < roomImages.length) {
//       roomImages.removeAt(index);
//     }
//   }

//   // Uploads all room images to Firebase Storage and stores their URLs
//   // Returns true if successful, false otherwise
//   Future<bool> uploadRoomImages() async {
//     if (roomImages.isEmpty) return false;

//     isUploading.value = true;

//     // Show progress dialog
//     Get.dialog(
//       const Center(child: CircularProgressIndicator()),
//       barrierDismissible: false,
//     );

//     try {
//       for (var image in roomImages) {
//         final ref = FirebaseStorage.instance.ref().child(
//           'room_images/${DateTime.now().toIso8601String()}',
//         );
//         final uploadTask = ref.putFile(image);
//         final snapshot = await uploadTask.whenComplete(() {});
//         final url = await snapshot.ref.getDownloadURL();
//         roomImageUrls.add(url);
//       }
//       roomImages.clear();
//       return true;
//     } catch (e) {
//       debugPrint('Error uploading room images: $e');
//       // Display error message
//       Get.snackbar(
//         "Upload Failed",
//         "Failed to upload images: ${e.toString()}",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return false;
//     } finally {
//       // Close the progress dialog
//       if (Get.isDialogOpen == true) Get.back();
//       isUploading.value = false;
//     }
//   }

//   // Clears both temporary images and image URLs
//   void clearRoomImages() {
//     roomImages.clear();
//     roomImageUrls.clear();
//   }

//   // Gets current user ID from Firebase Auth
//   final String? uid = FirebaseAuth.instance.currentUser?.uid;

//   // Submits room data to Firestore including image URLs
//   Future<void> submitRoom() async {
//     // Show progress dialog
//     Get.dialog(
//       const Center(child: CircularProgressIndicator()),
//       barrierDismissible: false,
//     );

//     try {
//       if (uid == null) {
//         if (Get.isDialogOpen == true) Get.back();
//         Get.snackbar("Error", "User not logged in");
//         return;
//       }

//       // Add image URLs to room data before submission
//       roomData['room_images'] = roomImageUrls;

//       // Add room data to Firestore under the hotel document
//       DocumentReference roomRef = await _firestore
//           .collection('hotels')
//           .doc(uid)
//           .collection('rooms')
//           .add(roomData);

//       String roomId = roomRef.id;

//       // Create final room data with additional fields
//       Map<String, dynamic> finalRoomData = {
//         ...roomData,
//         'roomId': roomId,
//         'created_at': FieldValue.serverTimestamp().toString(),
//         'status': 'nonbooked',
//       };

//       // Update the document with the final data including roomId
//       await roomRef.update(finalRoomData);
//       roomData.clear();
//       await getRooms();

//       // Close progress dialog
//       if (Get.isDialogOpen == true) Get.back();

//       Get.snackbar(
//         "Success",
//         "Room data added successfully", 
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       Get.offAll(MyNavigationBar());
//     } catch (e) {
//       // Close progress dialog in case of error
//       if (Get.isDialogOpen == true) Get.back();

//       Get.snackbar(
//         "Error",
//         "Failed to add room data: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   // Fetches all rooms for the current hotel from Firestore
//   Future<void> getRooms() async {
//     try {
//       if (uid == null) {
//         Get.snackbar("Error", "User not logged in");
//         return;
//       }

//       final snapshot =
//           await _firestore
//               .collection('hotels')
//               .doc(uid)
//               .collection('rooms')
//               .get();

//       log('Rooms fetched: ${snapshot.docs}');

//       // Convert Firestore documents to RoomModel objects
//       roomList.value =
//           snapshot.docs.map((doc) => RoomModel.fromJson(doc.data())).toList();

//       Get.snackbar(
//         "Success",
//         "Rooms loaded successfully",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } catch (e) {
//       log(e.toString());
//       Get.snackbar(
//         "Error",
//         "Failed to load rooms: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   // Room type dropdown management
//   RxString? roomsSelectedItem = RxString('');

//   // Updates the selected room type
//   void setRoomSelectedItem(String? value) {
//     roomsSelectedItem?.value = value ?? '';
//   }

//   // Deletes a room from Firestore by ID
//   Future<void> deleteRoom(String roomId) async {
//     try {
//       if (uid == null) {
//         Get.snackbar("Error", "User not logged in");
//         return;
//       }

//       log('Attempting to delete room: $roomId');

//       await _firestore
//           .collection('hotels')
//           .doc(uid)
//           .collection('rooms')
//           .doc(roomId)
//           .delete();

//       log('Room deleted successfully: $roomId');

//       await getRooms(); // Refresh room list after deletion

//       Get.snackbar(
//         "Success",
//         "Room deleted successfully",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } catch (e) {
//       log('Error deleting room: ${e.toString()}');
//       Get.snackbar(
//         "Error",
//         "Failed to delete room: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
// }
