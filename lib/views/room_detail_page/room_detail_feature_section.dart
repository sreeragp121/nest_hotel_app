import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/room_detail_page/widgets/feature_category_section.dart';

class RoomDetailFeatureSection extends StatelessWidget {
  const RoomDetailFeatureSection({
    super.key,
    required this.index,
    required this.roomController,
    required this.roomData,
  });

  final int index;
  final RoomControllerNew roomController;
  final RoomModel roomData;

  @override
  Widget build(BuildContext context) {
    final diningFeatures = [
      FeatureItem(
        'Free Breakfast',
        roomData.freeBreakfast,
        Icons.breakfast_dining,
      ),
      FeatureItem('Free Lunch', roomData.freeLunch, Icons.lunch_dining),
      FeatureItem('Free Dinner', roomData.freeDinner, Icons.dinner_dining),
    ];

    final roomFeatures = [
      FeatureItem('Cupboard', roomData.cupboard, Icons.door_sliding),
      FeatureItem('Wardrobe', roomData.wardrobe, Icons.door_front_door),
      FeatureItem('Air Conditioner', roomData.airConditioner, Icons.ac_unit),
      FeatureItem('Kitchen', roomData.kitchen, Icons.kitchen),
      FeatureItem('Swimming Pool', roomData.swimmingPool, Icons.pool),
    ];

    final serviceFeatures = [
      FeatureItem('Wifi', roomData.wifi, Icons.wifi),
      FeatureItem('Parking', roomData.parking, Icons.local_parking),
      FeatureItem('Elevator', roomData.elevator, Icons.elevator),
      FeatureItem('Laundry', roomData.laundry, Icons.local_laundry_service),
      FeatureItem(
        'House Keeping',
        roomData.houseKeeping,
        Icons.cleaning_services,
      ),
    ];

    final policy = [
      FeatureItem('Smoking Allowded', roomData.smokingAllowed, Icons.block),
      FeatureItem('Pets Allowded', roomData.petsAllowed, Icons.pets),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stylish header with icon
          Row(
            children: [
              Icon(Icons.hotel, color: AppColors.primary, size: 28),
              const SizedBox(width: 12),
              Text(
                'Room Features',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 36),

          // Room Features Section
          FeatureCategorySection(
            title: 'Room Amenities',
            categoryIcon: Icons.bedroom_parent,
            features: roomFeatures,
          ),
          const SizedBox(height: 24),

          // Dining Features Section
          FeatureCategorySection(
            title: 'Dining Options',
            categoryIcon: Icons.restaurant,
            features: diningFeatures,
          ),
          const SizedBox(height: 24),

          // Service Features Section
          FeatureCategorySection(
            title: 'Services & Facilities',
            categoryIcon: Icons.room_service,
            features: serviceFeatures,
          ),
                                        
          const SizedBox(height: 24),
          
          FeatureCategorySection(
            title: 'Policy',
            categoryIcon: Icons.policy,
            features: policy,
          ),
        ],
      ),
    );
  }
}
