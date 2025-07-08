import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/room_detail_page/widgets/room_info_items_card.dart';

class RoomDetailBasicInfo extends StatelessWidget {
  final int index;
  const RoomDetailBasicInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    final RoomModel roomData = roomController.roomList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Informations',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoomDetaiInfolItem(
              label: 'Room Area',
              value: roomData.roomArea,
              icon: Icons.square_foot,
              unit: 'sqft',
            ),
            RoomDetaiInfolItem(
              label: 'Bed Type',
              value: roomData.bedType,
              icon: Icons.bed,
            ),
            RoomDetaiInfolItem(
              label: 'No.Of Beds',
              value: roomData.numberOfRooms,
              icon: Icons.view_agenda,
              unit: 'sqft',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoomDetaiInfolItem(
              label: 'Price',
              value: '₹  ${roomData.basePrice}',
              valueColors: AppColors.secondary,
              icon: Icons.money,
            ),
            RoomDetaiInfolItem(
              label: 'Adults',
              value: roomData.maxAdults,
              icon: Icons.person,
            ),
            RoomDetaiInfolItem(
              label: 'Childrens',
              value: roomData.maxChildren,
              icon: Icons.view_agenda,
            ),
          ],
        ),
      ],
    );
  }
}