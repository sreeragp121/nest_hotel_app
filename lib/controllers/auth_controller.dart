import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nest_hotel_app/services/registration_firebase_services.dart';
import 'package:nest_hotel_app/views/navigation_bar/navigation_bar_main.dart';
import 'package:nest_hotel_app/views/registration_pages/reg_wating_screen.dart/reg_wating_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/start_register_screen/start_registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';

class AuthController extends GetxController {
  // Firebase and GoogleSignIn instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final RegistrationFirebaseService _firebaseService =
      RegistrationFirebaseService();

  // Current user UID
  final uid = FirebaseAuth.instance.currentUser?.uid;

  // Observables and state variables
  var user = Rx<User?>(null);
  var errorMessage = ''.obs;
  var showOtpField = false.obs;
  var verificationId = ''.obs;
  bool isRegistered = false;
  bool isApproved = false;

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
  }

  /// Fetch the hotel (profile) status of the user
  Future<void> hoterlStatus() async {
    final docId = await _firebaseService.checkProfileExists(user.value!.uid);
    if (docId != null) {
      isRegistered = true;

      // Fetch the document once immediately
      final docSnap = await _firebaseService.getProfileOnce(
        user.value!.uid,
        docId,
      );
      if (docSnap.exists) {
        final data = docSnap.data();
        final model = _firebaseService.convertToModel(
          user.value!.uid,
          docId,
          data,
        );

        log(model.verificationSatus.toLowerCase());

        // Check approval based on verification status
        if (model.verificationSatus.toLowerCase() != 'pending') {
          isApproved = true;
        } else {
          isApproved = false;
        }
      }
    } else {
      // If no document found
      isRegistered = false;
      isApproved = false;
    }
  }

  /// Initialize app based on user's profile status
  Future<void> initializeApp() async {
    try {
      await hoterlStatus();

      log("Registration status: $isRegistered");
      log("Approval status: $isApproved");

      if (isRegistered) {
        if (isApproved) {
          Get.offAll(() => MyNavigationBar());
        } else {
          Get.offAll(() => RegWatingScreen());
        }
      } else {
        Get.offAll(() => const StartRegisterScreen());
      }
    } catch (e) {
      log("Error in initializeApp: $e");
      Get.snackbar("Error", "Failed to initialize: $e");
    }
  }

  /// Register user using Google Sign-In
  Future<bool> regUsingGoogleAcc() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      user.value = userCredential.user;

      if (user.value != null) {
        await saveUserLoggedIn();
        Get.snackbar(
          "Success",
          "Google Sign-In Successful",
          backgroundColor: AppColors.green,
        );
        await initializeApp();
        return true;
      }
      return false;
    } catch (e) {
      log("Google Sign-In Error: $e");
      Get.snackbar("Error", "Google Sign-In Failed: ${e.toString()}");
      return false;
    }
  }

  /// Create new account using Email and Password
  Future<String?> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user?.uid ?? "";
      await saveUserLoggedIn();
      return uid;
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Unknown error";
      return null;
    }
  }

  /// Login existing user using Email and Password
  Future<void> loginAccount(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      user.value = _auth.currentUser;
      await saveUserLoggedIn();
      await initializeApp();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login failed");
    }
  }

  /// Logout user and clear saved login state
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    user.value = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    Get.snackbar(
      "Success",
      "Logout Successful",
      backgroundColor: AppColors.green,
    );
    Get.offAll(() => const LogInPageMain());
  }

  /// Send OTP to user's phone number for Phone Authentication
  void sendOTP(TextEditingController phoneNumbers) async {
    String phoneNumber = '+91${phoneNumbers.text.trim()}';
    log("Sending OTP to: $phoneNumber");

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          user.value = _auth.currentUser;
          await saveUserLoggedIn();
          Get.snackbar("Success", "Auto verification successful!");
          await initializeApp();
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error", "Verification failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          showOtpField.value = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log("Auto retrieval timeout");
        },
      );
    } catch (e) {
      Get.snackbar("Error", "Error sending OTP: $e");
    }
  }

  /// Verify OTP manually entered by the user
  Future<void> verifyOTP(TextEditingController otpController) async {
    try {
      if (verificationId.value.isEmpty) {
        Get.snackbar("Error", "No OTP request found.");
        return;
      }

      String otp = otpController.text.trim();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      user.value = _auth.currentUser;
      await saveUserLoggedIn();
      Get.snackbar("Success", "OTP Verified Successfully!");
      await initializeApp();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "OTP Verification Failed: ${e.message}");
    }
  }

  /// Send a password reset email
  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  /// Check if the user is already logged in (SharedPreferences)
  Future<bool> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');
    return isLoggedIn ?? false;
  }

  /// Save the user's logged in status (SharedPreferences)
  Future saveUserLoggedIn() async {
    log('Saving login status in SharedPreferences');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    log('Login status saved: ${prefs.getBool('isLoggedIn')}');
  }
}
