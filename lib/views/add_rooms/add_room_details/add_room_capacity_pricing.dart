import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/add_rooms/add_room_details/room_type_widgets.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddRoomCapacityAndPricing extends StatelessWidget {
  const AddRoomCapacityAndPricing({
    super.key,
    required this.roomController,
    required this.myAppValidators,
  });

  final RoomControllerNew roomController;
  final MyAppValidators myAppValidators;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'Capacity & Pricing',
      children: [
        MyCustomTextFormField(
          controller: roomController.maxAdultsController,
          hintText: 'Enter Maximum Adults',
          labelText: 'Number Of Maximum Adults',
          prefixIcon: Icons.person,
          validator:
              (value) =>
                  myAppValidators.validateNames(value, name: 'Maximum Adults'),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
        ),
        const SizedBox(height: 20),
        MyCustomTextFormField(
          controller: roomController.maxChildrenController,
          hintText: 'Enter Maximum Children',
          labelText: 'Number Of Maximum Children',
          prefixIcon: Icons.child_care,
          validator:
              (value) => myAppValidators.validateNames(
                value,
                name: 'Maximum Children',
              ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
        ),
        const SizedBox(height: 20),
        MyCustomTextFormField(
          controller: roomController.basePriceController,
          hintText: 'Enter Base Price',
          labelText: 'Base Price',
          prefixIcon: Icons.currency_rupee,
          validator:
              (value) => myAppValidators.validateNames(
                value,
                name: 'Maximum Children',
              ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(5),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
