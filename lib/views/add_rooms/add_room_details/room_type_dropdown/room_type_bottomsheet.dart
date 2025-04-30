import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/room_type_dropdown/room_type_list_item.dart';

class RoomTypeBottomSheet extends StatelessWidget {
  final List<RoomTypeListModel> roomTypes;
  final RoomTypeListModel? selectedRoomType;
  final Function(RoomTypeListModel) onRoomTypeSelected;

  const RoomTypeBottomSheet({
    super.key,
    required this.roomTypes,
    this.selectedRoomType,
    required this.onRoomTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Bottom sheet header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha((0.05 * 255).toInt()),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withAlpha((0.3 * 255).toInt()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Select Room Type',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Choose the type of room you prefer',
                    style: TextStyle(fontSize: 14, color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ),

          // Room type list
          Expanded(
            child: ListView.builder(
              itemCount: roomTypes.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final roomType = roomTypes[index];
                final isSelected =
                    selectedRoomType?.roomTypeName == roomType.roomTypeName;

                return RoomTypeListItem(
                  roomType: roomType,
                  isSelected: isSelected,
                  onTap: () {
                    onRoomTypeSelected(roomType);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required List<RoomTypeListModel> roomTypes,
    RoomTypeListModel? selectedRoomType,
    required Function(RoomTypeListModel) onRoomTypeSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => RoomTypeBottomSheet(
            roomTypes: roomTypes,
            selectedRoomType: selectedRoomType,
            onRoomTypeSelected: onRoomTypeSelected,
          ),
    );
  }
}
