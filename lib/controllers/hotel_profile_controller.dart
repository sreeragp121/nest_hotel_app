import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';

class HotelProfileController extends GetxController {
  final RegistrationFirebaseService _firebaseService =
      RegistrationFirebaseService();

  final Rxn<HotelModel> profileData = Rxn<HotelModel>();
  String? get uid => _firebaseService.uid;

  @override
  void onInit() {
    super.onInit();
    getProfileOfHotel();
  }

  Future<void> getProfileOfHotel() async {
    final docSnap = await _firebaseService.getProfileOnce(uid!);

    if (docSnap.exists) {
      final HotelModel data = HotelModel.fromJson(
        docSnap.data() as Map<String, dynamic>,
      );

      profileData.value = data;
    }
  }
}
