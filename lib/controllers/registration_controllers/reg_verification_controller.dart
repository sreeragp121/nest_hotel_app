import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  final RxBool isApproved = false.obs;
  final RxBool isRegisterd = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    listenToVerificationStatus(); // check once on init
  }

  void listenToVerificationStatus() async {
    if (uid == null) return;
    log(uid.toString());
    final profileData =
        await _firestore
            .collection('hotels')
            .doc(uid)
            .collection('profile')
            .get();
    if (profileData.docs.isNotEmpty) {
      isRegisterd.value = true;

      final docId = profileData.docs.first.id;
      _firestore
          .collection('hotels')
          .doc(uid)
          .collection('profile')
          .doc(docId)
          .snapshots()
          .listen((doc) async {
            if (doc.exists) {
              final data = doc.data();
              final status = data?['verificationSatus'];

              if (status == 'approv') {
                isApproved.value = true;
              }
            }
          });
    }
  }
}
