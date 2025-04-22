import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/room_amentites/room_amentities.dart';
import 'package:nest_hotel_app/views/add_rooms/room_facillity/room_facility_card.dart';

class RoomFacility extends StatelessWidget {
  RoomFacility({super.key});

  final _formKey = GlobalKey<FormState>();

  static const primaryColor = AppColors.primary;

  final RoomConstants roomConstants = RoomConstants();

  @override
  Widget build(BuildContext context) {
    final RoomController roomController = Get.find<RoomController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Room Facilities',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C3E50)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: roomConstants.facilitiesGroups.length,
                  itemBuilder: (context, groupIndex) {
                    final group = roomConstants.facilitiesGroups[groupIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            group['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF95A5A6),
                            ),
                          ),
                        ),
                        ...group['items']
                            .map<Widget>(
                              (item) => Obx(
                                () => RoomFacilityCard(
                                  title: item['name'],
                                  icon: item['icon'],
                                  value:
                                      roomController.roomData[item['name']] ??
                                      false,
                                  onChanged: (value) {
                                    roomController.updateRoomData(
                                      item['name'],
                                      value,
                                    );
                                  },
                                ),
                              ),
                            )
                            .toList(),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withAlpha((0.05 * 255).toInt()),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.off(() => RoomAmenities());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue to Amenities',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
