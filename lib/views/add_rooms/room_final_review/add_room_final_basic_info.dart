import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/models/room_models/room_type_list_model.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/room_type_dropdown/room_type_dropdown.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/widgets/custom_dropdown.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class RoomBasicInfo extends StatelessWidget {
  const RoomBasicInfo({
    super.key,
    required this.roomController,
    required this.roomConstants,
    required this.myAppValidators,
  });

  final RoomControllerNew roomController;
  final RoomConstants roomConstants;
  final MyAppValidators myAppValidators;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Basic Information'),
        Text(
          'Room type',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black54,
          ),
        ),
        SizedBox(height: 8),
        Obx(
          () => RoomTypeDropdown(
            selectedRoomType: RoomTypeListModel(
              roomTypeName: roomController.roomType.value,
              roomTypeDescription: roomController.roomTypeDiscription.value,
            ),
            hintText: 'Select room type',
            // Add this line to use the observable
            roomTypes: roomConstants.roomTypeList,
            onChanged: (newValue) {
              roomController.selectRoomType(newValue!);
            },
          ),
        ),
        const SizedBox(height: 10),
        MyCustomTextFormField(
          controller: roomController.roomNameController,
          hintText: 'Enter Room Name',
          labelText: 'Room Name',
          prefixIcon: Icons.meeting_room,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Room Name'),
        ),
        const SizedBox(height: 10),
        MyCustomTextFormField(
          controller: roomController.roomDescription,
          hintText: 'Enter Room Description',
          labelText: 'Room Description',
          prefixIcon: Icons.meeting_room,
          maxLines: 10,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Room Name'),
        ),
        const SizedBox(height: 10),
        MyCustomTextFormField(
          controller: roomController.roomAreaController,
          hintText: 'Enter Room Area',
          labelText: 'Room Area (e.g., 250 sq. ft)',
          prefixIcon: Icons.square_foot,
          keyboardType: TextInputType.number,
          validator: (value) => myAppValidators.validateArea(value),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const SizedBox(height: 10),
        Text(
          'Bed Type',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black54,
          ),
        ),
        SizedBox(height: 8),
        Obx(
          () => CustomDropdown(
            hintText: 'Select Bed Type ',
            value: roomController.bedType.value,
            items: roomConstants.bedTypes,
            onChanged: (value) => roomController.selectBedType(value!),
          ),
        ),
        const SizedBox(height: 10),
        MyCustomTextFormField(
          controller: roomController.numberOfRoomsController,
          hintText: 'Enter Number Of Beds',
          keyboardType: TextInputType.number,
          labelText: 'Number Of Beds',
          prefixIcon: Icons.bed,
          validator: (value) => myAppValidators.validateNumberOfRooms(value),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
        ),
      ],
    );
  }
}
