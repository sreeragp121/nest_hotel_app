class RegistrationModel {
  final String? profileImage;
  final String accommodationType;
  final bool entireProperty;
  final bool privateProperty;
  final String? selectedYear;
  final bool freeCancellation;
  final bool coupleFriendly;
  final bool parking;
  final bool restaurantInsideProperty;
  final String propertyType;
  final String hasRegistration;
  final String stayName;
  final String contactNumber;
  final String email;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String panNumber;
  final String propertyNumber;
  final String gstNumber;
  final List<String> images;

  RegistrationModel({
    this.profileImage,
    required this.accommodationType,
    required this.entireProperty,
    required this.privateProperty,
    required this.selectedYear,
    required this.freeCancellation,
    required this.coupleFriendly,
    required this.parking,
    required this.restaurantInsideProperty,
    required this.propertyType,
    required this.hasRegistration,
    required this.stayName,
    required this.contactNumber,
    required this.email,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.panNumber,
    required this.propertyNumber,
    required this.gstNumber,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'accommodationType': accommodationType,
      'entireProperty': entireProperty,
      'privateProperty': privateProperty,
      'selectedYear': selectedYear,
      'freeCancellation': freeCancellation,
      'coupleFriendly': coupleFriendly,
      'parking': parking,
      'restaurantInsideProperty': restaurantInsideProperty,
      'propertyType': propertyType,
      'hasRegistration': hasRegistration,
      'stayName': stayName,
      'contactNumber': contactNumber,
      'email': email,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'panNumber': panNumber,
      'propertyNumber': propertyNumber,
      'gstNumber': gstNumber,
      'images': images,
    };
  }
}
