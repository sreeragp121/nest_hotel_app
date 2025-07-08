import 'package:get/get.dart';

class MyTextfieldController extends GetxController {
  bool obscureText = true;

  visibilityButtonClick() {
    obscureText = !obscureText;
    update();
  }
}
