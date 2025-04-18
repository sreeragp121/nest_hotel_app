import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/models/registration_model.dart';

class RegFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<List<String>> uploadImages(List<File> images) async {
    final List<String> uploadedUrls = [];

    if (images.isEmpty) {
      Get.snackbar(
        "Warning",
        "No images selected for upload",
        snackPosition: SnackPosition.BOTTOM,
      );
      return uploadedUrls;
    }

    int successCount = 0;

    for (int i = 0; i < images.length; i++) {
      try {
        final uniqueFileName =
            '${uid}_${DateTime.now().millisecondsSinceEpoch}_$i';
        final ref = _storage.ref().child('images/$uniqueFileName');

        // Upload the image
        final uploadTask = ref.putFile(images[i]);
        final snapshot = await uploadTask.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();

        uploadedUrls.add(url);
        successCount++;
      } catch (e) {
        Get.snackbar(
          "Image Upload Error",
          "Failed to upload image ${i + 1}: $e",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    if (successCount > 0) {
      Get.snackbar(
        "Success",
        "Successfully uploaded $successCount images",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return uploadedUrls;
  }

  /// Adds user registration data to Firestore under `hotels/{uid}/profile/{uid}`
  Future<void> addUserData(RegistrationModel user) async {
    try {
      if (uid == null) {
        Get.snackbar("Error", "User not logged in");
        return;
      }

      await _firestore
          .collection('hotels')
          .doc(uid)
          .collection('profile')
          .doc()
          .set(user.toJson());

      Get.snackbar(
        "Success",
        "Hotel data added successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add hotel data: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
