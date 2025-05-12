import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomDetailImageController extends GetxController {
  final currentIndex = 0.obs;
  PageController? pageController;
  List<String> roomImages = [];

  void setInitialData({required int index, required List<String> images}) {
    currentIndex.value = index;
    roomImages = images;
    pageController = PageController(initialPage: index);
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (pageController != null &&
        currentIndex.value < roomImages.length - 1) {
      pageController!.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (pageController != null && currentIndex.value > 0) {
      pageController!.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController?.dispose(); 
    super.onClose();
  }
}
