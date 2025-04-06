import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/models/registration_model.dart';

class RegistrationController extends GetxController {

  var accommodationTypeindex = (-1).obs;
  var accommodationType = ''.obs;
  var entireProperty = false.obs;
  var privateProperty = false.obs;
  var selectedYear = Rxn<String>();
  var freeCancellation = false.obs;
  var coupleFriendly = false.obs;
  var parking = false.obs;
  var restaurantInsideProperty = false.obs;
  var propertyType = 'Owned'.obs;
  var hasRegistration = 'Yes'.obs;
  final stayNameController = TextEditingController();
  final contactNumberController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final pincodeController = TextEditingController();
  final panNumberController = TextEditingController();
  final propertyNumberController = TextEditingController();
  final gstNumberController = TextEditingController();
  final images = <String>[].obs;
  

  void selectProperty(int index) {
    accommodationTypeindex.value = index;
  }

  void selectEntireProperty() {
    entireProperty.value = !entireProperty.value;
  }

  void selectPrivateProperty() {
    privateProperty.value = !privateProperty.value;
  }

  void setSelectedYear(String? year) {
    selectedYear.value = year;
  }

  void selectFreeCancellation() {
    freeCancellation.value = !freeCancellation.value;
  }

  void selectCoupleFriendly() {
    coupleFriendly.value = !coupleFriendly.value;
  }

  void selectParking() {
    parking.value = !parking.value;
  }

  void selectrestaurantInsideProperty() {
    restaurantInsideProperty.value = !restaurantInsideProperty.value;
  }

  void setPropertyType(String value) {
    propertyType.value = value;
  }

  void setRegistration(String value) {
    hasRegistration.value = value;
  }

  Future<void> getCurrentLocation() async {
    try {
      // Step 1: Check permission status
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // Step 2: Request permission if denied
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          Get.snackbar(
            "Permission Denied",
            "Location permission is required to fetch location",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          "Permission Denied Forever",
          "Please enable location permission from settings",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Step 3: Get position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Step 4: Convert to address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        cityController.text = place.locality ?? '';
        stateController.text = place.administrativeArea ?? '';
        countryController.text = place.country ?? '';
        pincodeController.text = place.postalCode ?? '';
      }
    } catch (e) {
      Get.snackbar(
        "Location Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void submit() {
    final model = RegistrationModel(
      accommodationType: accommodationType.value,
      entireProperty: entireProperty.value,
      privateProperty: privateProperty.value,
      selectedYear: selectedYear.value ?? '',
      freeCancellation: freeCancellation.value,
      coupleFriendly: coupleFriendly.value,
      parking: parking.value,
      restaurantInsideProperty: restaurantInsideProperty.value,
      propertyType: propertyType.value,
      hasRegistration: hasRegistration.value,
      stayName: stayNameController.text,
      contactNumber: contactNumberController.text,
      email: emailController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
      pincode: pincodeController.text,
      panNumber: panNumberController.text,
      propertyNumber: propertyNumberController.text,
      gstNumber: gstNumberController.text,
      images: images.toList(),
    );

    addUserData(model);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserData(RegistrationModel user) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
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
