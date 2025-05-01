import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/services/my_app_validators.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/widgets/my_custom_textfield.dart';

class AddRoomCapacityPricing extends StatelessWidget {
  const AddRoomCapacityPricing({
    super.key,
    required this.roomController,
    required this.myAppValidators,
  });

  final RoomControllerNew roomController;
  final MyAppValidators myAppValidators;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, 
      children: [
        const SectionTitle(title: 'Capacity & Pricing'),
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
        const SizedBox(height: 10),
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
        const SizedBox(height: 10),
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
      ],
    );
  }
}
