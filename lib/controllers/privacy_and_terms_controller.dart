// controllers/privacy_policy_controller.dart
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  var markdownData = ''.obs;
  var termsMarkdownData = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadPrivacyAndTerms();
  }

  void loadPrivacyAndTerms() {
    loadPrivacyPolicy();
    loadTermsAndCondition();
  }

  Future<void> loadPrivacyPolicy() async {
    try {
      final String data = await rootBundle.loadString('assets/privacy_policy.md');
      markdownData.value = data;
    } catch (e) {
      markdownData.value = 'Failed to load privacy policy.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadTermsAndCondition() async {
    try {
      final String data = await rootBundle.loadString('assets/terms_and_condition.md');
      termsMarkdownData.value = data;
    } catch (e) {
      termsMarkdownData.value = 'Failed to load Terms and Conditions.';
    } finally {
      isLoading.value = false;
    }
  }
}
