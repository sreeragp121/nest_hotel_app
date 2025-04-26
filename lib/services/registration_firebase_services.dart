import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/registration_model.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';

class RegistrationFirebaseService {
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getProfileOnce(
    String uid,
    String docId,
  ) {
    return _firestore
        .collection('hotels')
        .doc(uid)
        .collection('profile')
        .doc(docId)
        .get();
  }

  //---------------add hotel---------------
  Future<void> addHotelData(RegistrationModel user) async {
    try {
      if (uid == null) {
        MyCustomSnackBar.show(
          title: "Error",
          message: "User not logged in",
          backgroundColor: AppColors.red,
        );
        return;
      }

      await _firestore
          .collection('hotels')
          .doc(uid)
          .collection('profile')
          .doc()
          .set(user.toJson());
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

  Future<String?> checkProfileExists(String uid) async {
    try {
      final profileSnapshot =
          await _firestore
              .collection('hotels')
              .doc(uid)
              .collection('profile')
              .get();

      if (profileSnapshot.docs.isNotEmpty) {
        return profileSnapshot.docs.first.id;
      }
      return null;
    } catch (e) {
      log('Error checking profile: ${e.toString()}');
      return null;
    }
  }

  // Stream for real-time profile data
  Stream<DocumentSnapshot> getProfileStream(String uid, String docId) {
    return _firestore
        .collection('hotels')
        .doc(uid)
        .collection('profile')
        .doc(docId)
        .snapshots();
  }

  // Convert document data to RegistrationModel
  RegistrationModel convertToModel(
    String uid,
    String docId,
    Map<String, dynamic>? data,
  ) {
    if (data == null) {
      // Return empty model if no data
      return RegistrationModel(
        uid: uid,
        profileId: docId,
        profileImage: '',
        verificationSatus: '',
        contactNumber: '',
        email: '',
        city: '',
        state: '',
        country: '',
        pincode: '',
        stayName: '',
        accommodationType: '',
        propertyType: '',
        entireProperty: false,
        privateProperty: false,
        restaurantInsideProperty: false,
        parking: false,
        hasRegistration: '',
        panNumber: '',
        propertyNumber: '',
        gstNumber: '',
        selectedYear: '',
        freeCancellation: false,
        coupleFriendly: false,
        images: [],
      );
    }

    return RegistrationModel(
      uid: uid,
      profileImage: data['profileImage'] ?? '',
      profileId: docId,
      verificationSatus: data['verificationSatus'] ?? '',
      contactNumber: data['contactNumber'] ?? '',
      email: data['email'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      country: data['country'] ?? '',
      pincode: data['pincode'] ?? '',
      stayName: data['stayName'] ?? '',
      accommodationType: data['accommodationType'] ?? '',
      propertyType: data['propertyType'] ?? '',
      entireProperty: data['entireProperty'] ?? false,
      privateProperty: data['privateProperty'] ?? false,
      restaurantInsideProperty: data['restaurantInsideProperty'] ?? false,
      parking: data['parking'] ?? false,
      hasRegistration: data['hasRegistration'] ?? '',
      panNumber: data['panNumber'] ?? '',
      propertyNumber: data['propertyNumber'] ?? '',
      gstNumber: data['gstNumber'] ?? '',
      selectedYear: data['selectedYear'] ?? '',
      freeCancellation: data['freeCancellation'] ?? false,
      coupleFriendly: data['coupleFriendly'] ?? false,
      images: List<String>.from(data['images'] ?? []),
    );
  }
}
