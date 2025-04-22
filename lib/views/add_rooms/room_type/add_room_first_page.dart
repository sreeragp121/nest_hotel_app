import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/views/add_rooms/room_facillity/room_facilities.dart';
import 'package:nest_hotel_app/views/add_rooms/room_type/room_textform.dart';
import 'package:nest_hotel_app/widgets/custom_dropdown.dart';
import 'room_type_widgets.dart';

class AddRoomFirstPage extends StatelessWidget {
  AddRoomFirstPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final Color primaryBlue =AppColors.primary;
  final Color textColor = const Color(0xFF2D3142);

  @override
  Widget build(BuildContext context) {
    final RoomController roomController = Get.put(RoomController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Add Room Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withAlpha((0.05 * 255).toInt()),
              AppColors.white,
            ],
          ),
        ),
        child: Padding(
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
                          value: roomController.roomsSelectedItem?.value,
                          items: roomController.roomsItems,
                          onChanged: (String? newValue) {
                            roomController.setRoomSelectedItem(newValue);
                            roomController.updateRoomData(
                              'room_type',
                              newValue,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      RoomCustomFormField(
                        label: 'Room Area',
                        hint: 'Enter room area',
                        onChanged: (value) {
                          roomController.updateRoomData('room_area', value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Room area is required';
                          }
                          return null;
                        },
                        prefixIcon: Icons.square_foot,
                        primaryColor: primaryBlue,
                        textColor: textColor,
                      ),
                      const SizedBox(height: 20),
                      RoomCustomFormField(
                        label: 'Room Size',
                        hint: 'Enter room size in sq. ft',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          roomController.updateRoomData(
                            'Property Size',
                            int.tryParse(value),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Room size is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        prefixIcon: Icons.architecture,
                        primaryColor: primaryBlue,
                        textColor: textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomSection(
                    title: 'Capacity & Pricing',
                    textColor: textColor,
                    children: [
                      RoomCustomFormField(
                        label: 'Extra Adults',
                        hint: 'Enter number of extra adults allowed',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          roomController.updateRoomData(
                            'Number of Extra Adults Allowed',
                            int.tryParse(value),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Extra adults count is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        prefixIcon: Icons.person_add,
                        primaryColor: primaryBlue,
                        textColor: textColor,
                      ),
                      const SizedBox(height: 20),
                      RoomCustomFormField(
                        label: 'Extra Children',
                        hint: 'Enter number of extra children allowed',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          roomController.updateRoomData(
                            'Number of Extra Child Allowed',
                            int.tryParse(value),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Extra children count is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        prefixIcon: Icons.child_care,
                        primaryColor: primaryBlue,
                        textColor: textColor,
                      ),
                      const SizedBox(height: 20),
                      RoomCustomFormField(
                        label: 'Base Price',
                        hint: 'Enter base price',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          roomController.updateRoomData(
                            'Base Price',
                            int.tryParse(value),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Base price is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        prefixIcon: Icons.attach_money,
                        primaryColor: primaryBlue,
                        textColor: textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomContinueButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.off(RoomFacility());
                      }
                    },
                    text: 'Continue to Facilities',
                    primaryColor: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
