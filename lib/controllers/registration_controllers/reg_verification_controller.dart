import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';

class ProfileDataController extends GetxController {
  final RegistrationFirebaseService _firebaseService =
      RegistrationFirebaseService();

  final RxBool isApproved = false.obs;
  final RxBool isRegisterd = false.obs;

  final Rxn<HotelModel> profileData = Rxn<HotelModel>();

  String? get uid => _firebaseService.uid;

 Future<void> listenToVerificationStatus() async {
    if (uid == null) return;
    log(uid.toString());

    final docId = await _firebaseService.checkProfileExists(uid!);

    if (docId != null) {
      isRegisterd.value = true;

      // Listen to real-time changes on this specific doc
      _firebaseService.getProfileStream(uid!,).listen((docSnap) {
        if (docSnap.exists) {
          final HotelModel data = HotelModel.fromJson(
            docSnap.data() as Map<String, dynamic>,
          );
          // final model = _firebaseService.convertToModel(uid!, docId, data);

          // profileData.value = model;
          profileData.value = data;
          // Update approval status
          if (data.verificationStatus.toLowerCase() != 'pending') {
            isApproved.value = true;
          } else {
            isApproved.value = false;
          }
        }
      });
    } else {
      isRegisterd.value = false;
      isApproved.value = false;
    }
  }
}
