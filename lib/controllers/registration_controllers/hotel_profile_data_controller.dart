import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';

class ProfileDataController extends GetxController {
  final RegistrationFirebaseService _firebaseService =
      RegistrationFirebaseService();

  final RxBool isApproved = false.obs;
  final RxBool isRegistered = false.obs;

  final Rxn<HotelModel> profileData = Rxn<HotelModel>();

  String? get uid => _firebaseService.uid;

  Future<void> getProfileOfHotel() async {
    if (uid == null) return;
    final docSnap = await _firebaseService.getProfileOnce(uid!);

    if (docSnap.exists) {
      isRegistered.value = true;
      final HotelModel data = HotelModel.fromJson(
        docSnap.data() as Map<String, dynamic>,
      );

      profileData.value = data;

      // Check approval based on verification status
      if (data.verificationStatus.toLowerCase() != 'pending') {
        isApproved.value = true;
      } else {
        isApproved.value = false;
      }
    } else {
      // If no document found
      isRegistered.value = false;
      isApproved.value = false;
    }
  }

  void clearData() {
    isApproved.value = false;
    isRegistered.value = false;
    profileData.value = null;
  }
}
