import 'package:flutter/material.dart';

class RoomConstants {
  
  final List<Map<String, dynamic>> facilitiesGroups = [
    {
      'title': 'Storage',
      'items': [
        {'name': 'Cupboard', 'icon': Icons.weekend,},
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

  final List<String> roomsItems = [
    'Single Room',
    'Double Room',
    'Suite',
    'Deluxe',
    'Executive',
  ];
}
