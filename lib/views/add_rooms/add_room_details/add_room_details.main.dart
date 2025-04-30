import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/add_rooms/room_facillity/room_facilities.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/room_textform.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/custom_dropdown.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'room_type_widgets.dart';

class AddRoomFirstPage extends StatelessWidget {
  AddRoomFirstPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final Color primaryBlue = AppColors.primary;
  final Color textColor = const Color(0xFF2D3142);
  final RoomConstants roomConstants = RoomConstants();

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.put(RoomControllerNew());

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Add Room Details',
        leadingIcon: Icons.hotel,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomSection(
                  title: 'Basic Information',
                  textColor: textColor,
                  children: [
                    Obx(
                      () => CustomDropdown(
                        hintText: 'Select room type',
                        value: roomController.roomType.value,
                        items: roomConstants.roomsItems,
                        onChanged: (newValue) {
                          roomController.selectRoomType(newValue!);
                          // roomController.updateRoomData(
                          //   'room_type',
                          //   newValue,
                          // );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                //     RoomCustomFormField(
                //       label: 'Room Area',
                //       hint: 'Enter room area',
                //       onChanged: (value) {
                //         roomController.updateRoomData('room_area', value);
                //       },
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Room area is required';
                //         }
                //         return null;
                //       },
                //       prefixIcon: Icons.square_foot,
                //       primaryColor: primaryBlue,
                //       textColor: textColor,
                //     ),
                //     const SizedBox(height: 20),
                //     RoomCustomFormField(
                //       label: 'Room Size',
                //       hint: 'Enter room size in sq. ft',
                //       keyboardType: TextInputType.number,
                //       onChanged: (value) {
                //         roomController.updateRoomData(
                //           'Property Size',
                //           int.tryParse(value),
                //         );
                //       },
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Room size is required';
                //         }
                //         if (int.tryParse(value) == null) {
                //           return 'Please enter a valid number';
                //         }
                //         return null;
                //       },
                //       prefixIcon: Icons.architecture,
                //       primaryColor: primaryBlue,
                //       textColor: textColor,
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20),
                // CustomSection(
                //   title: 'Capacity & Pricing',
                //   textColor: textColor,
                //   children: [
                //     RoomCustomFormField(
                //       label: 'Number of Adults',
                //       hint: 'Enter number of adults allowed',
                //       keyboardType: TextInputType.number,
                //       onChanged: (value) {
                //         roomController.updateRoomData(
                //           'Number of  Adults Allowed',
                //           int.tryParse(value),
                //         );
                //       },
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Adults count is required';
                //         }
                //         if (int.tryParse(value) == null) {
                //           return 'Please enter a valid number';
                //         }
                //         return null;
                //       },
                //       prefixIcon: Icons.person_add,
                //       primaryColor: primaryBlue,
                //       textColor: textColor,
                //     ),
                //     const SizedBox(height: 20),
                //     RoomCustomFormField(
                //       label: 'Number of  Children',
                //       hint: 'Enter number of extra children allowed',
                //       keyboardType: TextInputType.number,
                //       onChanged: (value) {
                //         roomController.updateRoomData(
                //           'Number of Extra Child Allowed',
                //           int.tryParse(value),
                //         );
                //       },
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Children count is required';
                //         }
                //         if (int.tryParse(value) == null) {
                //           return 'Please enter a valid number';
                //         }
                //         return null;
                //       },
                //       prefixIcon: Icons.child_care,
                //       primaryColor: primaryBlue,
                //       textColor: textColor,
                //     ),
                //     const SizedBox(height: 20),
                //     RoomCustomFormField(
                //       label: 'Base Price',
                //       hint: 'Enter base price',
                //       keyboardType: TextInputType.number,
                //       onChanged: (value) {
                //         roomController.updateRoomData(
                //           'Base Price',
                //           int.tryParse(value),
                //         );
                //       },
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Base price is required';
                //         }
                //         if (int.tryParse(value) == null) {
                //           return 'Please enter a valid number';
                //         }
                //         return null;
                //       },
                //       prefixIcon: Icons.attach_money,
                //       primaryColor: primaryBlue,
                //       textColor: textColor,
                //     ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MyCustomButton(
          onPressed: () {
            log(roomController.roomType.value);
            if (_formKey.currentState!.validate()) {
              // Get.to(RoomFacility());
            }
          },
          backgroundcolor: AppColors.primary,
          textcolor: AppColors.white,
          text: 'Continue to Facilities',
        ),
      ),
    );
  }
}
