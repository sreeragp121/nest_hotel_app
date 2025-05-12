import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/widgets/room_detail_features_card.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/room_list_images/room_detail_list_images.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/widgets/roominfodetailcard.dart';

class RoomDetailCard extends StatelessWidget {
  final int index;
  final RoomControllerNew roomController;
  const RoomDetailCard({
    super.key,
    required this.index,
    required this.roomController,
  });

  @override
  Widget build(BuildContext context) {
    final roomData = roomController.roomList[index];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          roomData.roomImages.isNotEmpty
              ? Image.network(
                roomData.roomImages.first,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              )
              : Container(
                height: 400,
                color: AppColors.grey300,
                child: Icon(Icons.image, size: 50, color: AppColors.grey),
              ),
               const SizedBox(height: 10),
              RoomDetailListImages(roomData: roomData),
              const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                RoomInfoDetailCard(index: index, roomController: roomController),
                const SizedBox(height: 24.0),
                Text(
                  'Features',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
                FeatureCard(
                  feature: 'Cupboard',
                  isAvailable: roomData.cupboard,
                  customIcon: Icons.door_sliding,
                ),
                FeatureCard(
                  feature: 'Wardrobe',
                  isAvailable: roomData.wardrobe,
                  customIcon: Icons.door_front_door,
                ),
                FeatureCard(
                  feature: 'Free Breakfast',
                  isAvailable: roomData.freeBreakfast,
                  customIcon: Icons.breakfast_dining,
                ),
                FeatureCard(
                  feature: 'Free Lunch',
                  isAvailable: roomData.freeLunch,
                  customIcon: Icons.lunch_dining,
                ),
                FeatureCard(
                  feature: 'Free Dinner',
                  isAvailable: roomData.freeDinner,
                  customIcon: Icons.dinner_dining,
                ),
                FeatureCard(
                  feature: 'Laundry',
                  isAvailable: roomData.laundry,
                  customIcon: Icons.local_laundry_service,
                ),
                FeatureCard(
                  feature: 'Elevator',
                  isAvailable: roomData.elevator,
                  customIcon: Icons.elevator,
                ),
                FeatureCard(
                  feature: 'Air Conditioner',
                  isAvailable: roomData.airConditioner,
                  customIcon: Icons.ac_unit,
                ),
                FeatureCard(
                  feature: 'House Keeping',
                  isAvailable: roomData.houseKeeping,
                  customIcon: Icons.cleaning_services,
                ),
                FeatureCard(
                  feature: 'Kitchen',
                  isAvailable: roomData.kitchen,
                  customIcon: Icons.kitchen,
                ),
                FeatureCard(
                  feature: 'Wifi',
                  isAvailable: roomData.wifi,
                  customIcon: Icons.wifi,
                ),
                FeatureCard(
                  feature: 'Parking',
                  isAvailable: roomData.parking,
                  customIcon: Icons.local_parking,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
