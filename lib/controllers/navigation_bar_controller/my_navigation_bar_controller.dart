import 'dart:developer';

import 'package:get/get.dart';

class MyNavigationBarController extends GetxController {
  RxInt selectedIndex = 2.obs;

  void changeIndex(int value) {
    log(value.toString());
    selectedIndex.value = value;
    log('index ${selectedIndex.value.toString()}');
  }
}
