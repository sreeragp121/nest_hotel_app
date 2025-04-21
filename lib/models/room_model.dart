class RoomModel {
  // Basic Room Details
  final String roomArea;
  final String roomType;
  final int propertySize;
  final int selectExtraBedTypes;

  // Room Features
  final bool cupboard;
  final bool wardrobe;
  final bool freeBreakfast;
  final bool freeLunch;
  final bool freeDinner;

  // Pricing & Capacity
  final int basePrice;
  final int numberOfExtraAdultsAllowed;
  final int numberOfExtraChildAllowed;

  // Amenities
  final bool laundry;
  final bool elevator;
  final bool airConditioner;
  final bool houseKeeping;
  final bool kitchen;
  final bool wifi;
  final bool parking;

  // Images and Meta
  final List<String> roomImages;
  final String roomId;
  final String createdAt;
  final String status;

  RoomModel({
    required this.roomArea,
    required this.roomType,
    required this.propertySize,
    required this.selectExtraBedTypes,
    required this.cupboard,
    required this.wardrobe,
    required this.freeBreakfast,
    required this.freeLunch,
    required this.freeDinner,
    required this.basePrice,
    required this.numberOfExtraAdultsAllowed,
    required this.numberOfExtraChildAllowed,
    required this.laundry,
    required this.elevator,
    required this.airConditioner,
    required this.houseKeeping,
    required this.kitchen,
    required this.wifi,
    required this.parking,
    required this.roomImages,
    required this.roomId,
    required this.createdAt,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "room_area": roomArea,
      "room_type": roomType,
      "Property Size": propertySize,
      "Select Extra Bed Types": selectExtraBedTypes,
      "Cupboard": cupboard,
      "Wardrobe": wardrobe,
      "Free Breakfast": freeBreakfast,
      "Free Lunch": freeLunch,
      "Free Dinner": freeDinner,
      "Base Price": basePrice,
      "Number of Extra Adults Allowed": numberOfExtraAdultsAllowed,
      "Number of Extra Child Allowed": numberOfExtraChildAllowed,
      "Laundry": laundry,
      "Elevator": elevator,
      "Air Conditioner": airConditioner,
      "House Keeping": houseKeeping,
      "Kitchen": kitchen,
      "Wifi": wifi,
      "Parking": parking,
      "room_images": roomImages,
      "roomId": roomId,
      "created_at": createdAt,
      "status": status,
    };
  }

  // Method to create a copy of the current object with updated values
  RoomModel copyWith({
    String? roomArea,
    String? roomType,
    int? propertySize,
    int? selectExtraBedTypes,
    bool? cupboard,
    bool? wardrobe,
    bool? freeBreakfast,
    bool? freeLunch,
    bool? freeDinner,
    int? basePrice,
    int? numberOfExtraAdultsAllowed,
    int? numberOfExtraChildAllowed,
    bool? laundry,
    bool? elevator,
    bool? airConditioner,
    bool? houseKeeping,
    bool? kitchen,
    bool? wifi,
    bool? parking,
    List<String>? roomImages,
    String? roomId,
    String? createdAt,
    String? status,
  }) {
    return RoomModel(
      roomArea: roomArea ?? this.roomArea,
      roomType: roomType ?? this.roomType,
      propertySize: propertySize ?? this.propertySize,
      selectExtraBedTypes: selectExtraBedTypes ?? this.selectExtraBedTypes,
      cupboard: cupboard ?? this.cupboard,
      wardrobe: wardrobe ?? this.wardrobe,
      freeBreakfast: freeBreakfast ?? this.freeBreakfast,
      freeLunch: freeLunch ?? this.freeLunch,
      freeDinner: freeDinner ?? this.freeDinner,
      basePrice: basePrice ?? this.basePrice,
      numberOfExtraAdultsAllowed:
          numberOfExtraAdultsAllowed ?? this.numberOfExtraAdultsAllowed,
      numberOfExtraChildAllowed:
          numberOfExtraChildAllowed ?? this.numberOfExtraChildAllowed,
      laundry: laundry ?? this.laundry,
      elevator: elevator ?? this.elevator,
      airConditioner: airConditioner ?? this.airConditioner,
      houseKeeping: houseKeeping ?? this.houseKeeping,
      kitchen: kitchen ?? this.kitchen,
      wifi: wifi ?? this.wifi,
      parking: parking ?? this.parking,
      roomImages: roomImages ?? this.roomImages,
      roomId: roomId ?? this.roomId,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomArea: json["room_area"] ?? '',
      roomType: json["room_type"] ?? '',
      propertySize: json["Property Size"] ?? 0,
      selectExtraBedTypes: json["Select Extra Bed Types"] ?? 0,
      cupboard: json["Cupboard"] ?? false,
      wardrobe: json["Wardrobe"] ?? false,
      freeBreakfast: json["Free Breakfast"] ?? false,
      freeLunch: json["Free Lunch"] ?? false,
      freeDinner: json["Free Dinner"] ?? false,
      basePrice: json["Base Price"] ?? 0,
      numberOfExtraAdultsAllowed: json["Number of Extra Adults Allowed"] ?? 0,
      numberOfExtraChildAllowed: json["Number of Extra Child Allowed"] ?? 0,
      laundry: json["Laundry"] ?? false,
      elevator: json["Elevator"] ?? false,
      airConditioner: json["Air Conditioner"] ?? false,
      houseKeeping: json["House Keeping"] ?? false,
      kitchen: json["Kitchen"] ?? false,
      wifi: json["Wifi"] ?? false,
      parking: json["Parking"] ?? false,
      roomImages: List<String>.from(json["room_images"] ?? []),
      roomId: json["roomId"] ?? '',
      createdAt: json["created_at"] ?? '',
      status: json["status"] ?? '',
    );
  }
}
