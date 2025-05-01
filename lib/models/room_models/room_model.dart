import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';

class RoomModel {
  // Basic Room Info
  final String? roomId;
  final String roomName;
  final RoomTypeListModel roomType;
  final String roomArea;
  final String propertySize; 
  final String bedType;
  final String numberOfBeds;

  // Capacity & Pricing
  final String maxAdults;
  final String maxChildren;
  final String selectExtraBedTypes;
  final String basePrice;

  // Meal Inclusion
  final bool freeBreakfast;
  final bool freeLunch;
  final bool freeDinner;

  // Room Features
  final bool cupboard;
  final bool wardrobe;

  // Amenities
  final bool laundry;
  final bool elevator;
  final bool airConditioner;
  final bool houseKeeping;
  final bool kitchen;
  final bool wifi;
  final bool parking;
  final bool swimmingPool;

  // Policy
  final bool smokingAllowed;
  final bool petsAllowed;

  // Meta
  final List<String> roomImages;
  final String createdAt;
  final String? status;
  final List<String> tags;
  final String checkInTime;
  final String checkOutTime;

  RoomModel({
    this.roomId,
    required this.roomName,
    required this.roomType,
    required this.roomArea,
    required this.propertySize,
    required this.bedType,
    required this.numberOfBeds,
    required this.maxAdults,
    required this.maxChildren,
    required this.selectExtraBedTypes,
    required this.basePrice,
    required this.freeBreakfast,
    required this.freeLunch,
    required this.freeDinner,
    required this.cupboard,
    required this.wardrobe,
    required this.laundry,
    required this.elevator,
    required this.airConditioner,
    required this.houseKeeping,
    required this.kitchen,
    required this.wifi,
    required this.parking,
    required this.swimmingPool,
    required this.smokingAllowed,
    required this.petsAllowed,
    required this.roomImages,
    required this.createdAt,
    this.status,
    required this.tags,
    required this.checkInTime,
    required this.checkOutTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "roomId": roomId,
      "room_name": roomName,
      "room_type": roomType,
      "room_area": roomArea,
      "property_size": propertySize,
      "bed_type": bedType,
      "number_of_beds": numberOfBeds,
      "max_adults": maxAdults,
      "max_children": maxChildren,
      "select_extra_bed_types": selectExtraBedTypes,
      "base_price": basePrice,
      "free_breakfast": freeBreakfast,
      "free_lunch": freeLunch,
      "free_dinner": freeDinner,
      "cupboard": cupboard,
      "wardrobe": wardrobe,
      "laundry": laundry,
      "elevator": elevator,
      "air_conditioner": airConditioner,
      "house_keeping": houseKeeping,
      "kitchen": kitchen,
      "wifi": wifi,
      "parking": parking,
      "swimmingPool":swimmingPool,
      "smoking_allowed": smokingAllowed,
      "pets_allowed": petsAllowed,
      "room_images": roomImages,
      "created_at": createdAt,
      "status": status,
      "tags": tags,
      "check_in_time": checkInTime,
      "check_out_time": checkOutTime,
    };
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomId: json["roomId"] ?? '',
      roomName: json["room_name"] ?? '',
      roomType: json["room_type"] ?? '',
      roomArea: json["room_area"] ?? '',
      propertySize: json["property_size"] ?? 0,
      bedType: json["bed_type"] ?? '',
      numberOfBeds: json["number_of_beds"] ?? 0,
      maxAdults: json["max_adults"] ?? 0,
      maxChildren: json["max_children"] ?? 0,
      selectExtraBedTypes: json["select_extra_bed_types"] ?? 0,
      basePrice: json["base_price"] ?? 0,
      freeBreakfast: json["free_breakfast"] ?? false,
      freeLunch: json["free_lunch"] ?? false,
      freeDinner: json["free_dinner"] ?? false,
      cupboard: json["cupboard"] ?? false,
      wardrobe: json["wardrobe"] ?? false,
      laundry: json["laundry"] ?? false,
      elevator: json["elevator"] ?? false,
      airConditioner: json["air_conditioner"] ?? false,
      houseKeeping: json["house_keeping"] ?? false,
      kitchen: json["kitchen"] ?? false,
      wifi: json["wifi"] ?? false,
      parking: json["parking"] ?? false,
      swimmingPool: json["swimmingPool"] ?? false,
      smokingAllowed: json["smoking_allowed"] ?? false,
      petsAllowed: json["pets_allowed"] ?? false,
      roomImages: List<String>.from(json["room_images"] ?? []),
      createdAt: json["created_at"] ?? '',
      status: json["status"] ?? '',
      tags: List<String>.from(json["tags"] ?? []),
      checkInTime: json["check_in_time"] ?? '',
      checkOutTime: json["check_out_time"] ?? '',
    );
  }
}
