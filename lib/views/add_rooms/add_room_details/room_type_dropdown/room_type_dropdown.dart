import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/room_type_dropdown/room_type_bottomsheet.dart';

class RoomTypeDropdown extends StatelessWidget {
  final String? hintText;
  final RoomTypeListModel? selectedRoomType;
  final List<RoomTypeListModel> roomTypes;
  final Function(RoomTypeListModel?) onChanged;

  const RoomTypeDropdown({
    super.key,
    this.hintText,
    this.selectedRoomType,
    required this.roomTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        border: Border.all(color: AppColors.grey300, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha((0.1 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          RoomTypeBottomSheet.show(
            onRoomTypeSelected: onChanged,
            roomTypes: roomTypes,
            context: context,
            selectedRoomType: selectedRoomType,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedRoomType!.roomTypeName.isNotEmpty
                          ? selectedRoomType!.roomTypeName
                          : hintText ?? 'Select Room Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            selectedRoomType!.roomTypeName.isNotEmpty
                                ? FontWeight.w600
                                : FontWeight.normal,
                        color:
                            selectedRoomType!.roomTypeName.isNotEmpty
                                ? AppColors.black
                                : AppColors.grey,
                      ),
                    ),
                    if (selectedRoomType!.roomTypeName.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          selectedRoomType!.roomTypeDiscription,
                          style: TextStyle(fontSize: 13, color: AppColors.grey),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(Icons.arrow_drop_down, size: 24, color: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
