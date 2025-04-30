import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/room_constants.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/add_room_capacity_pricing.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/add_room_basic_info.dart';
import 'package:nest_hotel_app/views/add_rooms/room_facillity/room_facilities.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_snackbar.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';
import 'room_type_widgets.dart';

class AddRoomFirstPage extends StatelessWidget {
  AddRoomFirstPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final RoomConstants roomConstants = RoomConstants();

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.put(RoomControllerNew());
    final MyAppValidators myAppValidators = MyAppValidators();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Add Room Details',
        leadingIcon: Icons.hotel,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AddRoomBasicInfo(
                    roomController: roomController,
                    roomConstants: roomConstants,
                    myAppValidators: myAppValidators,
                  ),
                  const SizedBox(height: 20),

                  AddRoomCapacityAndPricing(
                    roomController: roomController,
                    myAppValidators: myAppValidators,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MyCustomButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (roomController.roomType.isEmpty) {
                MyCustomSnackBar.show(
                  title: 'Select Room type',
                  message: 'You are not Select Room type',
                  backgroundColor: AppColors.red,
                );
              } else if (roomController.bedType.isEmpty) {
                MyCustomSnackBar.show(
                  title: 'Select Bed type',
                  message: 'You are not Select Bed type',
                  backgroundColor: AppColors.red,
                );
              } else {
                Get.to(RoomFacility());
              }
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
