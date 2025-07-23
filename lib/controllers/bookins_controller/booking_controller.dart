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
  var todayBoookings = <BookingModel>[].obs;
  var isLoading = false.obs;

  var totalRevenue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHotelBookings();
    getTodayBookings();
    calculateTotalRevenue();
  }

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

  void getTodayBookings() async{
    final today = DateTime.now();

    todayBoookings.value =
        bookings.where((booking) {
          final checkIn = booking.checkInDate;
          return checkIn.year == today.year &&
              checkIn.month == today.month &&
              checkIn.day == today.day;
        }).toList();
  }

  void calculateTotalRevenue() async{
    double total = 0.0;

    for (var booking in bookings) {
      final amount = double.tryParse(booking.totalAmount) ?? 0.0;
      total += amount;
    }

    totalRevenue.value = total;
  }

  void clearBookings() {
    bookings.clear();
  }
}
