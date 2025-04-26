import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';
import 'package:nest_hotel_app/models/registration_model.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';
import 'package:nest_hotel_app/views/registration_pages/reg_wating_screen.dart/reg_wating_screen.dart';

class RegistrationController extends GetxController {
  var accommodationTypeindex = (-1).obs;
  var accommodationType = ''.obs;
  var propertyUsage = false.obs;
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
  // var images = <File>[].obs;
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final List<String> imageUrl = [];
  var editPageReadOnly = true.obs;
  //--------------edit page read oly text form field-------------------
  void changeReadonly() {
    editPageReadOnly.value = !editPageReadOnly.value;
    log(editPageReadOnly.value.toString());
    update();
  }
  //-------- Updates the selected index and type of accommodation-----------

  void selectProperty(int index) {
    accommodationTypeindex.value = index;
  }

  //--------- Toggles the 'Entire Property' option-----------------

  void selectEntireProperty() {
    propertyUsage.value = !propertyUsage.value;
  }

  //---------- Toggles the 'Private Property' option----------------

  void selectPrivateProperty() {
    privateProperty.value = !privateProperty.value;
  }

  //----------- Sets the selected year of establishment--------------

  void setSelectedYear(String? year) {
    selectedYear.value = year;
  }

  // -----------Toggles the 'Free Cancellation' option---------------

  void selectFreeCancellation() {
    freeCancellation.value = !freeCancellation.value;
  }

  //----------- Toggles the 'Couple Friendly' option-----------------

  void selectCoupleFriendly() {
    coupleFriendly.value = !coupleFriendly.value;
  }

  // -----------Toggles the 'Parking Available' option------------

  void selectParking() {
    parking.value = !parking.value;
  }

  //------------- Toggles the 'Restaurant Inside Property' option-----------

  void selectrestaurantInsideProperty() {
    restaurantInsideProperty.value = !restaurantInsideProperty.value;
  }

  //----------- Sets the type of property ownership (Owned/Rented)----------

  void setPropertyType(String value) {
    propertyType.value = value;
  }

  //-------- Sets the value indicating if the property has a government registration------------
  void setRegistration(String value) {
    hasRegistration.value = value;
  }

  //------------- Fetches the current location of the user and autho fill----------------

  Future<void> getCurrentLocation() async {
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Step 1: Check permission status
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // Step 2: Request permission if denied
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          if (Get.isDialogOpen == true) Get.back();
          Get.snackbar(
            "Permission Denied",
            "Location permission is required to fetch location",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (Get.isDialogOpen == true) Get.back();
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

      if (Get.isDialogOpen == true) Get.back(); // Close the dialog on success
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back(); // Close the dialog on error
      Get.snackbar(
        "Location Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final RegistrationFirebaseService _firebaseService = RegistrationFirebaseService();
  //------------ Handles the registration form submission--------------

  Future<void> submit() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      if (stayNameController.text.isEmpty ||
          contactNumberController.text.isEmpty ||
          emailController.text.isEmpty ||
          cityController.text.isEmpty) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar(
          "Validation Error",
          "Please fill in all required fields",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      final images = Get.find<AddImageController>().images;
      final uploadedUrls = await _firebaseService.uploadImages(images);
      if (uploadedUrls.isEmpty && images.isNotEmpty) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar(
          "Upload Failed",
          "Failed to upload images. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final model = RegistrationModel(
        uid: uid.toString(),
        profileImage: uploadedUrls.isNotEmpty ? uploadedUrls.first : '',
        profileId: uid.toString(),
        verificationSatus: 'pending',
        accommodationType: accommodationType.value,
        entireProperty: propertyUsage.value,
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
        images: uploadedUrls,
      );

      await _firebaseService.addHotelData(model);

      if (Get.isDialogOpen == true) Get.back();

      Get.snackbar(
        "Success",
        "Your property has been registered successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      Get.offAll(RegWatingScreen());
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
