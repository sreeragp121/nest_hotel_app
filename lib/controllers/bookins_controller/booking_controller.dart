import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nest_hotel_app/models/booking_model.dart';

class HotelBookingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserId => _auth.currentUser!.uid;
  var bookings = <BookingModel>[].obs;
  var isLoading = false.obs;

  /// Fetch bookings for a specific hotel
  Future<void> fetchHotelBookings() async {
    try {
      isLoading.value = true;
      final uid = currentUserId;
      final snapshot =
          await _firestore
              .collection('hotels')
              .doc(uid)
              .collection('bookings')
              .get();

      bookings.value =
          snapshot.docs
              .map((doc) => BookingModel.fromJson(doc.data()))
              .toList();
    } catch (e) {
      log('Error fetching hotel bookings: $e');
      bookings.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
