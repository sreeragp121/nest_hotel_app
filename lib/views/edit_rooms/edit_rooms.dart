import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/edit_room_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';
import 'package:nest_hotel_app/models/room_model.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class RoomEditingPage extends StatelessWidget {
  final RoomModel roomData;
  final RoomEditingController controller = Get.put(RoomEditingController());

  RoomEditingPage({super.key, required this.roomData}) {
    // Initialize the controller with roomData
    controller.initializeControllers(roomData);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Room Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              MyCustomTextFormField(
                controller: controller.roomAreaController,
                labelText: 'Room Area',
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 12),
              MyCustomTextFormField(
                controller: controller.roomTypeController,
                labelText: 'Room Type',
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 12),
              MyCustomTextFormField(
                controller: controller.propertySizeController,
                labelText: 'Property Size',
                keyboardType: TextInputType.number,
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 24),
              const Text(
                'Capacity & Pricing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              MyCustomTextFormField(
                controller: controller.extraBedTypesController,
                labelText: 'Extra Bed Types',
                keyboardType: TextInputType.number,
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 12),
              MyCustomTextFormField(
                controller: controller.basePriceController,
                labelText: 'Base Price',
                keyboardType: TextInputType.number,
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 12),
              MyCustomTextFormField(
                controller: controller.extraAdultsController,
                labelText: 'Extra Adults Allowed',
                keyboardType: TextInputType.number,
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 12),
              MyCustomTextFormField(
                controller: controller.extraChildController,
                labelText: 'Extra Children Allowed',
                keyboardType: TextInputType.number,
                validator:
                    (value) => value?.isEmpty ?? true ? 'Required field' : null,
              ),
              const SizedBox(height: 24),
              Center(
                child: MyCustomButton(
                  onPressed: () async{
                    if (formKey.currentState?.validate() ?? false) {
                     await controller.updateRoom(roomData.roomId);
                     Get.back();
                    }
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.white,
                  text: 'Update Room',
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
