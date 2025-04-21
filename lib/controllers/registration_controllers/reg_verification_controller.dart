import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/models/registration_model.dart';

class ProfileDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  final RxBool isApproved = false.obs;
  final RxBool isRegisterd = false.obs;
  final Rxn<RegistrationModel> profileData = Rxn<RegistrationModel>();

  @override
  void onInit() {
    super.onInit();
    listenToVerificationStatus(); // check once on init
  }

  void listenToVerificationStatus() async {
    if (uid == null) return;
    log(uid.toString());

    final profileSnapshot =
        await _firestore
            .collection('hotels')
            .doc(uid)
            .collection('profile')
            .get();

    if (profileSnapshot.docs.isNotEmpty) {
      isRegisterd.value = true;

      final doc = profileSnapshot.docs.first;
      final docId = doc.id;

      // Listen to real-time changes on this specific doc
      _firestore
          .collection('hotels')
          .doc(uid)
          .collection('profile')
          .doc(docId)
          .snapshots()
          .listen((docSnap) {
            if (docSnap.exists) {
              final data = docSnap.data();

              final model = RegistrationModel(
                uid: uid!,
                profileImage: data?['profileImage'] ?? '',
                profileId: docId,
                verificationSatus: data?['verificationSatus'] ?? '',

                contactNumber: data?['contactNumber'] ?? '',
                email: data?['email'] ?? '',

                city: data?['city'] ?? '',
                state: data?['state'] ?? '',
                country: data?['country'] ?? '',
                pincode: data?['pincode'] ?? '',

                stayName: data?['stayName'] ?? '',
                accommodationType: data?['accommodationType'] ?? '',
                propertyType: data?['propertyType'] ?? '',
                entireProperty: data?['entireProperty'] ?? false,
                privateProperty: data?['privateProperty'] ?? false,
                restaurantInsideProperty:
                    data?['restaurantInsideProperty'] ?? false,
                parking: data?['parking'] ?? false,

                hasRegistration: data?['hasRegistration'] ?? '',
                panNumber: data?['panNumber'] ?? '',
                propertyNumber: data?['propertyNumber'] ?? '',
                gstNumber: data?['gstNumber'] ?? '',

                selectedYear: data?['selectedYear'],
                freeCancellation: data?['freeCancellation'] ?? false,
                coupleFriendly: data?['coupleFriendly'] ?? false,

                images: List<String>.from(data?['images'] ?? []),
              );

              profileData.value = model;

              // Update approval status too
              if (model.verificationSatus == 'Approv') {
                isApproved.value = true;
              }
            }
          });
    }
  }
}
