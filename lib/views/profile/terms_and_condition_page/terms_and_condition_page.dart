import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/privacy_and_terms_controller.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PrivacyPolicyController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Markdown(
                  data: controller.termsMarkdownData.value,
                  padding: const EdgeInsets.all(16),
                  styleSheet: MarkdownStyleSheet(
                    h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    p: const TextStyle(fontSize: 16),
                  ),
                );
        }),
      ),
    );
  }
}
