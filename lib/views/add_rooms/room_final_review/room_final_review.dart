import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/room_final_review/room_submission_image.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/faciltity_chip.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/info_card.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class RoomsSubmissionPage extends StatelessWidget {
  const RoomsSubmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.find<RoomControllerNew>();

    return Scaffold(
      appBar: AppBar(title: const Text('Final Review')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final roomData = roomController.roomFacilitysList;

          final amenities = {
            'Cupboard': roomData['Cupboard'] ?? false,
            'Wardrobe': roomData['Wardrobe'] ?? false,
            'Free Breakfast': roomData['Free Breakfast'] ?? false,
            'Free Lunch': roomData['Free Lunch'] ?? false,
            'Free Dinner': roomData['Free Dinner'] ?? false,
            'Laundry': roomData['Laundry'] ?? false,
            'Elevator': roomData['Elevator'] ?? false,
            'Air Conditioner': roomData['Air Conditioner'] ?? false,
            'House Keeping': roomData['House Keeping'] ?? false,
            'Kitchen': roomData['Kitchen'] ?? false,
            'Wifi': roomData['Wifi'] ?? false,
            'Parking': roomData['Parking'] ?? false,
          };

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Review your room details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                InfoCard(title: 'Room Area', value: roomData['room_area']),
                InfoCard(
                  title: 'Property Size',
                  value: roomData['Property Size'],
                ),
                InfoCard(title: 'Room Type', value: roomData['room_type']),
                InfoCard(title: 'Base Price', value: roomData['Base Price']),
                InfoCard(
                  title: 'Extra Adults Allowed',
                  value: roomData['Number of Extra Adults Allowed'],
                ),
                InfoCard(
                  title: 'Extra Child Allowed',
                  value: roomData['Number of Extra Child Allowed'],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Amenities:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      amenities.entries.map((entry) {
                        return FacilityChip(
                          title: entry.key,
                          value: entry.value,
                        );
                      }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Uploaded Images:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const RoomSubmissionImage(),
                const SizedBox(height: 20),
                Center(
                  child: MyCustomButton(
                    onPressed: () async {
                      // await roomController.submitRoom();
                    },
                    backgroundcolor: AppColors.primary,
                    textcolor: AppColors.white,
                    text: 'Submit',
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
