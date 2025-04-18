class RegistrationModel {
  // Identity & Status
  final String uid;
  final String profileImage;
  final String profileId;
  final String verificationSatus;

  // Contact Info
  final String contactNumber;
  final String email;

  // Location
  final String city;
  final String state;
  final String country;
  final String pincode;

  // Property Details
  final String stayName;
  final String accommodationType;
  final String propertyType;
  final bool entireProperty;
  final bool privateProperty;
  final bool restaurantInsideProperty;
  final bool parking;

  // Business Details
  final String hasRegistration;
  final String panNumber;
  final String propertyNumber;
  final String gstNumber;

  // Preferences
  final String? selectedYear;
  final bool freeCancellation;
  final bool coupleFriendly;

  // Images
  final List<String> images;

  RegistrationModel({
    // Identity
    required this.uid,
   required this.profileImage,
   required this.profileId,
   required this.verificationSatus,

    // Contact Info
    required this.contactNumber,
    required this.email,

    // Location
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,

    // Property Details
    required this.stayName,
    required this.accommodationType,
    required this.propertyType,
    required this.entireProperty,
    required this.privateProperty,
    required this.restaurantInsideProperty,
    required this.parking,

    // Business Details
    required this.hasRegistration,
    required this.panNumber,
    required this.propertyNumber,
    required this.gstNumber,

    // Preferences
    required this.selectedYear,
    required this.freeCancellation,
    required this.coupleFriendly,

    // Images
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'profileImage': profileImage,
      'profileId':profileId,
      'verificationSatus': verificationSatus,
      'contactNumber': contactNumber,
      'email': email,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'stayName': stayName,
      'accommodationType': accommodationType,
      'propertyType': propertyType,
      'entireProperty': entireProperty,
      'privateProperty': privateProperty,
      'restaurantInsideProperty': restaurantInsideProperty,
      'parking': parking,
      'hasRegistration': hasRegistration,
      'panNumber': panNumber,
      'propertyNumber': propertyNumber,
      'gstNumber': gstNumber,
      'selectedYear': selectedYear,
      'freeCancellation': freeCancellation,
      'coupleFriendly': coupleFriendly,
      'images': images,
    };
  }
}
