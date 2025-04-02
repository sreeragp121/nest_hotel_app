import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var selectedIndex = (-1).obs;
  var entireProperty = false.obs;
  var privateProperty = false.obs;
  var selectedYear = Rxn<String>();
  var freeCancellation = false.obs;
  var coupleFriendly = false.obs;
  var parking = false.obs;
  var restaurantInsideProperty = false.obs;
  var propertyType = 'Owned'.obs;
  var hasRegistration = 'Yes'.obs;

  void selectProperty(int index) {
    selectedIndex.value = index;
  }

  void selectEntireProperty() {
    entireProperty.value = !entireProperty.value;
  }

  void selectPrivateProperty() {
    privateProperty.value = !privateProperty.value;
  }

  void setSelectedYear(String? year) {
    selectedYear.value = year;
  }

  void selectFreeCancellation() {
    freeCancellation.value = !freeCancellation.value;
  }

  void selectCoupleFriendly() {
    coupleFriendly.value = !coupleFriendly.value;
  }

  void selectParking() {
    parking.value = !parking.value;
  }

  void selectrestaurantInsideProperty() {
    restaurantInsideProperty.value = !restaurantInsideProperty.value;
  }

  void setPropertyType(String value) {
    propertyType.value = value;
  }

  void setRegistration(String value) {
    hasRegistration.value = value;
  }
}
