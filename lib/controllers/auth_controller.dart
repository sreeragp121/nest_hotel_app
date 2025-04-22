import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/reg_verification_controller.dart';
import 'package:nest_hotel_app/views/home_page.dart/home_page.dart';
import 'package:nest_hotel_app/views/registration_pages/reg_wating_screen.dart/reg_wating_screen.dart';
import 'package:nest_hotel_app/views/registration_pages/start_register_screen/start_registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_main.dart';

class AuthController extends GetxController {
  final ProfileDataController verificationController = Get.put(
    ProfileDataController(),
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var user = Rx<User?>(null);
  var errorMessage = ''.obs;
  var showOtpField = false.obs;
  var verificationId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
  }

  Future<void> navigationsOfscreen() async {
    verificationController.listenToVerificationStatus();
    await Future.delayed(const Duration(milliseconds: 500));
    final isRegistered = verificationController.isRegisterd.value;
    final isApproved = verificationController.isApproved.value;
    log(isRegistered.toString());
    log(isApproved.toString());
    if (isRegistered) {
      if (isApproved) {
        Get.off(() => const MyHomeScreen());
      } else {
        Get.off(() => RegWatingScreen());
      }
    } else {
      Get.off(() => const StartRegisterScreen());
    }
  }

  // ----------- Registration using Google Account ---------------
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
        // Get.offAll(() => const StartRegisterScreen());
        await navigationsOfscreen();

        return true;
      }
      return false;
    } catch (e) {
      log("Google Sign-In Error: $e");
      Get.snackbar("Error", "Google Sign-In Failed: ${e.toString()}");
      return false;
    }
  }

  // ----------- Registration using Email ---------------
  Future<String?> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user?.uid ?? "";
      return uid;
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Unknown error";
      return null;
    }
  }

  // ----------- Login using Email ---------------
  Future<void> loginAccount(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await saveUserLoggedIn();
      // Get.offAll(() => StartRegisterScreen());
      await navigationsOfscreen();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login failed");
    }
  }

  // ----------- Logout ---------------
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

  // ----------- Send OTP for Phone Authentication ---------------
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
          // Get.offAll(() => StartRegisterScreen());
          await navigationsOfscreen();
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

  // ----------- Verify OTP ---------------
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
      // Get.offAll(() => const StartRegisterScreen());
      await navigationsOfscreen();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "OTP Verification Failed: ${e.message}");
    }
  }

  // ----------- Forgot Password ---------------
  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  // ----------- Check if User is Logged In ---------------
  Future<bool> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');
    return isLoggedIn ?? false;
  }

  // ----------- Save User Logged In ---------------
  Future saveUserLoggedIn() async {
    log('Saving login status in SharedPreferences');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    log('Login status saved: ${prefs.getBool('isLoggedIn')}');
  }
}
