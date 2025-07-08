import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nest_hotel_app/models/review_model.dart';

class ReviewServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<List<ReviewRatingModel>> fetchHotelReviews({
    required String hotalId,
  }) async {
    final snapshot =
        await _firestore
            .collection('hotels')
            .doc(hotalId)
            .collection('review')
            .get();

    return snapshot.docs
        .map((doc) => ReviewRatingModel.fromJson(doc.data()))
        .toList();
  }
}
