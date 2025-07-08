import 'package:flutter/material.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_image.dart';
import 'package:nest_hotel_app/views/room_detail_page/room_detail_section.dart';

class RoomDetailPageMain extends StatelessWidget {
  final int index;
  const RoomDetailPageMain({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // room image section
          RoomDetailImage(index: index),
          
          //room detail section 
          RoomDetailSection(index: index),
        ],
      ),
    );
  }
}
