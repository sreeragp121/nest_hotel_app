import 'package:flutter/material.dart';

class RoomConstants {
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
}
