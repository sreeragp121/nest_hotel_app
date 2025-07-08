import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/models/review_model.dart';
import 'package:nest_hotel_app/services/review_services.dart';

class ReviewController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ReviewServices reviewServices = ReviewServices();

  List<ReviewRatingModel> reviews = [];

  int totalRating = 0;
  double averageRating = 0;
  double rating = 0;


  Future<void> fetchReviews() async {
    final hotelId = _auth.currentUser!.uid;
    try {
      reviews = await reviewServices.fetchHotelReviews(hotalId: hotelId);
      totalRating = reviews.fold(
        0,
        (sum, review) => sum + review.ratings.toInt(),
      );
      if (reviews.isNotEmpty) {
        averageRating = double.parse(
          (totalRating / reviews.length).toStringAsFixed(1),
        );
      } else {
        averageRating = 0.0;
      }
    } catch (e) {
      log('Error fetching bookings: $e');
    }
  }
  
}
