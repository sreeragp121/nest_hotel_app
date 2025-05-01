import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_images/add_room_images_main.dart';
import 'package:nest_hotel_app/views/add_rooms/room_amentites/widgets/amentity_card.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class RoomAmenities extends StatelessWidget {
  RoomAmenities({super.key});

  final _formKey = GlobalKey<FormState>();

  static const primaryColor = AppColors.primary;
  static final secondaryColor = AppColors.primary.withAlpha(
    (0.05 * 255).toInt(),
  );
  final textLightColor = AppColors.black38;

  final RoomConstants roomConstants = RoomConstants();

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return AppColors.white;
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      child: Scaffold(
        appBar: RegistrationAppBar(
          title: 'Room Amenities',
          leadingIcon: Icons.king_bed,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: roomConstants.amenitiesGroups.length,
                    itemBuilder: (context, groupIndex) {
                      final group = roomConstants.amenitiesGroups[groupIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              group['title'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: textLightColor,
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                () => AmenityCard(
                                  title: title,
                                  icon: amenity['icon'],
                                  value:
                                      roomController.roomFacilitysList[title] ??
                                      false,
                                  onChanged: (value) {
                                    roomController.updateRoomFacilitys(
                                      title,
                                      value ?? false,
                                    );
                                  },
                                  primaryColor: primaryColor,
                                  secondaryColor: secondaryColor,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
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
                Get.to(() => AddRoomImagesMain());
              }
            },
            backgroundcolor: AppColors.primary,
            text: 'Next',
            textcolor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
