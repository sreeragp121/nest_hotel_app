import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/time_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/time_box_widget.dart';

class AddRoomTimePicker extends StatelessWidget {
  const AddRoomTimePicker({
    super.key,
    required this.timeController,
  });

  final TimeController timeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Set Your Stay Timing',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black54,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Obx(
              () => TimeBoxWidget(
                label: "Check In",
                iconName: "in",
                time: timeController.checkInTime.value,
                onTap: () => timeController.pickTime(context, true),
                controller: timeController,
              ),
            ),
            SizedBox(width: 16),
            Obx(
              () => TimeBoxWidget(
                label: "Check Out",
                iconName: "out",
                time: timeController.checkOutTime.value,
                onTap: () => timeController.pickTime(context, false),
                controller: timeController,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}