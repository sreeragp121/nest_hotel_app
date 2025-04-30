import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/room_d_feature_row.dart';
import 'package:nest_hotel_app/views/rooms/room_detail_view/widgets/roominfodetailcard.dart';

class RoomDetailCard extends StatelessWidget {
  final int index;
  const RoomDetailCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final RoomController roomController = Get.find<RoomController>();
    final roomData = roomController.roomList[index];
    return ListView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child:
              roomData.roomImages.isNotEmpty
                  ? Image.network(
                    roomData.roomImages.first,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                  : Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
        ),
        const SizedBox(height: 24.0),
        RoomInfoDetailCard(index: index),
        const SizedBox(height: 24.0),
        Text('Features', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16.0),
        FeatureRow(
          feature: 'Cupboard',
          isAvailable: roomData.cupboard,
          customIcon: Icons.door_sliding,
        ),
        FeatureRow(
          feature: 'Wardrobe',
          isAvailable: roomData.wardrobe,
          customIcon: Icons.door_front_door,
        ),
        FeatureRow(
          feature: 'Free Breakfast',
          isAvailable: roomData.freeBreakfast,
          customIcon: Icons.breakfast_dining,
        ),
        FeatureRow(
          feature: 'Free Lunch',
          isAvailable: roomData.freeLunch,
          customIcon: Icons.lunch_dining,
        ),
        FeatureRow(
          feature: 'Free Dinner',
          isAvailable: roomData.freeDinner,
          customIcon: Icons.dinner_dining,
        ),
        FeatureRow(
          feature: 'Laundry',
          isAvailable: roomData.laundry,
          customIcon: Icons.local_laundry_service,
        ),
        FeatureRow(
          feature: 'Elevator',
          isAvailable: roomData.elevator,
          customIcon: Icons.elevator,
        ),
        FeatureRow(
          feature: 'Air Conditioner',
          isAvailable: roomData.airConditioner,
          customIcon: Icons.ac_unit,
        ),
        FeatureRow(
          feature: 'House Keeping',
          isAvailable: roomData.houseKeeping,
          customIcon: Icons.cleaning_services,
        ),
        FeatureRow(
          feature: 'Kitchen',
          isAvailable: roomData.kitchen,
          customIcon: Icons.kitchen,
        ),
        FeatureRow(
          feature: 'Wifi',
          isAvailable: roomData.wifi,
          customIcon: Icons.wifi,
        ),
        FeatureRow(
          feature: 'Parking',
          isAvailable: roomData.parking,
          customIcon: Icons.local_parking,
        ),
        const SizedBox(height: 24.0),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).cardColor.withAlpha((0.9 * 255).toInt()),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Additional Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 8.0),
                  Text(
                    'Adults Allowed: ${roomData.numberOfExtraAdultsAllowed}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Children Allowed: ${roomData.numberOfExtraChildAllowed}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
