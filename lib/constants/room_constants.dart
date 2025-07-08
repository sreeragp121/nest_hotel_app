import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';

class RoomConstants {
  final RoomControllerNew roomControllerNew = Get.find<RoomControllerNew>();

  final List<Map<String, dynamic>> facilitiesGroups = [
    {
      'title': 'Room Features',
      'items': [
        {'name': 'Cupboard', 'icon': Icons.weekend},
        {'name': 'Wardrobe', 'icon': Icons.door_sliding},
      ],
    },
    {
      'title': 'Meal Inclusion',
      'items': [
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
        {'name': 'Swimming Pool', 'icon': Icons.pool},
      ],
    },
    {
      'title': 'Policy',
      'items': [
        {'name': 'Smoking Allowed', 'icon': Icons.block},
        {'name': 'Pets Allowed', 'icon': Icons.pets},
      ],
    },
  ];



  final List<RoomTypeListModel> roomTypeList = [
    RoomTypeListModel(
      roomTypeName: 'Single',
      roomTypeDescription: 'for 1 guest, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Double',
      roomTypeDescription: 'for 2 guests, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Twin',
      roomTypeDescription: 'for 2 guests, 2 separate beds',
    ),
    RoomTypeListModel(
      roomTypeName: 'Deluxe',
      roomTypeDescription: 'luxurious room with living area',
    ),
    RoomTypeListModel(
      roomTypeName: 'Suite',
      roomTypeDescription: 'for 1 guest, 1 bed',
    ),
    RoomTypeListModel(
      roomTypeName: 'Family Room',
      roomTypeDescription: 'larger room for 3+ guests',
    ),
    RoomTypeListModel(
      roomTypeName: 'Studio',
      roomTypeDescription: 'combined living/sleeping space with small kitchen',
    ),
    RoomTypeListModel(
      roomTypeName: 'Executive Room',
      roomTypeDescription: 'business-focused features',
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
    'Murphy Bed',
    'Rollaway Bed',
  ];
  
}
