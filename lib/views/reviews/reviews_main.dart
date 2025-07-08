import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/review_controller/review_controller.dart';
import 'package:nest_hotel_app/views/reviews/widgets/reviews_card.dart';

class ReviewsMain extends StatelessWidget {
  const ReviewsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewController reviewController = Get.put(ReviewController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Reviews',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: reviewController.fetchReviews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            if (reviewController.reviews.isEmpty) {
              return Center(child: Text('No reviews for you'));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: reviewController.reviews.length,
                itemBuilder: (context, index) {
                  final review = reviewController.reviews[index];
                  return ReviewShowCard(reviews: review);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
