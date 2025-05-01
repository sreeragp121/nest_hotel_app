

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/widgets/add_room_facility_chip.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';

class AddRoomAmenities extends StatelessWidget {
  const AddRoomAmenities({
    super.key,
    required this.roomConstants,
    required this.roomController,
  });

  final RoomConstants roomConstants;
  final RoomControllerNew roomController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: roomConstants.amenitiesGroups.length,
      itemBuilder: (context, groupIndex) {
        final group = roomConstants.amenitiesGroups[groupIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: group['title']),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: group['items'].length,
              itemBuilder: (context, index) {
                final amenity = group['items'][index];
                final title = amenity['name'];
                return Obx(
                  () => AddRoomFacilityChip(
                    title: title,
                    icon: amenity['icon'],
                    value: roomController.roomFacilitysList[title] ?? false,
                    onChanged: (value) {
                      roomController.updateRoomFacilitys(title, value);
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}