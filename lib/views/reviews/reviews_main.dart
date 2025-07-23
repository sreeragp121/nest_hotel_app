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
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.reviews, size: 24, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Guest Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              'See what guests are saying',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.7 * 255).toInt()),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: reviewController.fetchReviews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            if (reviewController.reviews.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.reviews, size: 64, color: AppColors.grey400),
                    const SizedBox(height: 16),
                    Text(
                      'No reviews yet',
                      style: TextStyle(fontSize: 16, color: AppColors.grey600),
                    ),
                  ],
                ),
              );
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
