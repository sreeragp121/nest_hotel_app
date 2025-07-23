import 'package:get/get.dart';

class MyNavigationBarController extends GetxController {
  RxInt selectedIndex = 2.obs;

  void changeIndex(int value) {
    selectedIndex.value = value;
  }

  void clearNav() {
    selectedIndex.value = 2;
  }
}
