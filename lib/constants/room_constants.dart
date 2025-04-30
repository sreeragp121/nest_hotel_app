import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';

class RoomConstants {
  final RoomControllerNew roomControllerNew = Get.find<RoomControllerNew>();
  final List<Map<String, dynamic>> facilitiesGroups = [
    {
      'title': 'Storage',
      'items': [
        {'name': 'Cupboard', 'icon': Icons.weekend},
        {'name': 'Wardrobe', 'icon': Icons.door_sliding},
      ],
    },
    {
      'title': 'Meal Plans',
      'items': [
        {'name': 'Accommodation Only', 'icon': Icons.hotel},
        {'name': 'Free Breakfast', 'icon': Icons.free_breakfast},
        {'name': 'Free Lunch', 'icon': Icons.lunch_dining},
        {'name': 'Free Dinner', 'icon': Icons.dinner_dining},
      ],
    },
  ];

  final List<Map<String, dynamic>> amenitiesGroups = [
    {
      'title': 'Basic Amenities',
      'items': [
        {'name': 'Wifi', 'icon': Icons.wifi},
        {'name': 'Air Conditioner', 'icon': Icons.ac_unit},
        {'name': 'House Keeping', 'icon': Icons.cleaning_services},
      ],
    },
    {
      'title': 'Additional Features',
      'items': [
        {'name': 'Kitchen', 'icon': Icons.kitchen},
        {'name': 'Laundry', 'icon': Icons.local_laundry_service},
        {'name': 'Parking', 'icon': Icons.local_parking},
      ],
    },
    {
      'title': 'Building Features',
      'items': [
        {'name': 'Elevator', 'icon': Icons.elevator},
      ],
    },
  ];

  // final List<String> roomsItems = [
  //   'Single', // for 1 guest, 1 bed
  //   'Double', // for 2 guests, 1 bed
  //   'Twin', // for 2 guests, 2 separate beds
  //   'Deluxe', // higher-end room, possibly with more space or amenities
  //   'Suite', // luxurious room with living area
  //   'Family Room', // larger room for 3+ guests
  //   'Studio', // combined living/sleeping space with small kitchen
  //   'Executive Room', // business-focused features
  //   'Penthouse', // top-floor luxury unit
  // ];

  final List<RoomTypeListModel> roomTypeList = [
    RoomTypeListModel(
      roomTypeName: 'Single',
      roomTypeDiscription: 'for 1 guest, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Double',
      roomTypeDiscription: 'for 2 guests, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Twin',
      roomTypeDiscription: 'for 2 guests, 2 separate beds',
    ),
    RoomTypeListModel(
      roomTypeName: 'Deluxe',
      roomTypeDiscription: 'luxurious room with living area',
    ),
    RoomTypeListModel(
      roomTypeName: 'Suite',
      roomTypeDiscription: 'for 1 guest, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Family Room',
      roomTypeDiscription: 'larger room for 3+ guests',
    ),
    RoomTypeListModel(
      roomTypeName: 'Studio',
      roomTypeDiscription: 'combined living/sleeping space with small kitchen',
    ),
    RoomTypeListModel(
      roomTypeName: 'Executive Room',
      roomTypeDiscription: 'business-focused features',
    ),
  ];

  final List<String> bedTypes = [
    'Single Bed',
    'Double Bed',
    'Queen Bed',
    'King Bed',
    'Twin Beds',
    'Bunk Bed',
    'Sofa Bed',
    'Murphy Bed', // fold-down wall bed
    'Rollaway Bed',
  ];
}
