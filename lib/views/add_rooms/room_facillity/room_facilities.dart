import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/room_amentites/room_amentities.dart';
import 'package:nest_hotel_app/views/add_rooms/room_facillity/room_facility_card.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class RoomFacility extends StatelessWidget {
  RoomFacility({super.key});

  final _formKey = GlobalKey<FormState>();
  final RoomConstants roomConstants = RoomConstants();

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Room Facilities',
        leadingIcon: Icons.room_preferences,
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
                                      roomController.roomFacilitysList[item['name']] ??
                                      false,
                                  onChanged: (value) {
                                    roomController.updateRoomFacilitys(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MyCustomButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.to(() => RoomAmenities());
            }
          },
          backgroundcolor: AppColors.primary,
          textcolor: AppColors.white,
          text: 'Continue to Amenities',
        ),
      ),
    );
  }
}
