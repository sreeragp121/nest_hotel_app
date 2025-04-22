import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/constants/registration_constants.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';

class SelectPropertyList extends StatelessWidget {
  const SelectPropertyList({
    super.key,
    required this.rgistrationConstants,
    required this.propertyController,
  });

  final RegistrationConstants rgistrationConstants;
  final RegistrationController propertyController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rgistrationConstants.propertyTypes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  color:
                      propertyController
                                  .accommodationTypeindex
                                  .value ==
                              index
                          ? AppColors.primary
                          : AppColors.white,
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    rgistrationConstants.propertyTypes[index],
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          propertyController
                                      .accommodationTypeindex
                                      .value ==
                                  index
                              ? AppColors.white
                              : AppColors.black,
                    ),
                  ),
                  onTap: () {
                    propertyController.selectProperty(index);
                    propertyController.accommodationType.value =
                        rgistrationConstants.propertyTypes[index];
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
