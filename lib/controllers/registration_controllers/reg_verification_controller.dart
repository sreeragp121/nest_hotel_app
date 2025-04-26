import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/registration_model.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';

class ProfileDataController extends GetxController {
  final RegistrationFirebaseService _firebaseService =
      RegistrationFirebaseService();

  final RxBool isApproved = false.obs;
  final RxBool isRegisterd = false.obs;
  final Rxn<RegistrationModel> profileData = Rxn<RegistrationModel>();

  String? get uid => _firebaseService.uid;

  @override
  void onInit() {
    super.onInit();
    listenToVerificationStatus();
  }

   listenToVerificationStatus() async {
    if (uid == null) return;
    log(uid.toString());

    final docId = await _firebaseService.checkProfileExists(uid!);

    if (docId != null) {
      isRegisterd.value = true;
      
      // Listen to real-time changes on this specific doc
      _firebaseService.getProfileStream(uid!, docId).listen((docSnap) {
        if (docSnap.exists) {
          final data = docSnap.data() as Map<String, dynamic>?;
          final model = _firebaseService.convertToModel(uid!, docId, data);

          profileData.value = model;

          // Update approval status
          if (model.verificationSatus.toLowerCase() != 'pending') {
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
