import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/basic_info.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/contact_detail.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/legal_info.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/location.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/faciltity_chip.dart';

class HotelDetailsEditCard extends StatelessWidget {
  const HotelDetailsEditCard({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();

    return GetBuilder<RegistrationController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewPageBasicInfo(registrationController: registrationController),
            ReviewContactDetails(
              registrationController: registrationController,
            ),
            ReviewLocationCard(registrationController: registrationController),
            ReviewLegalInfoCard(registrationController: registrationController),
            const SectionTitle(title: 'Facilities & Features'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // FacilityChip(title: 'Leased', value: true),
                // FacilityChip(title: 'Registered', value: false),
                Obx(
                  () => FacilityChip(
                    title: 'Free Cancellation',
                    value: registrationController.freeCancellation.value,
                    chipFunction: registrationController.selectFreeCancellation,
                  ),
                ),
                Obx(
                  () => FacilityChip(
                    title: 'Couple Friendly',
                    value: registrationController.coupleFriendly.value,
                    chipFunction: registrationController.selectCoupleFriendly,
                  ),
                ),
                Obx(
                  () => FacilityChip(
                    title: 'Parking Available',
                    value: registrationController.parking.value,
                    chipFunction: registrationController.selectParking,
                  ),
                ),
                Obx(
                  () => FacilityChip(
                    title: 'Restaurant Inside Property',
                    value:
                        registrationController.restaurantInsideProperty.value,
                    chipFunction:
                        registrationController.selectrestaurantInsideProperty,
                  ),
                ),
              ],
            ),
            const SectionTitle(title: 'Hotel Images'),
            // EditImageListView(
            //   listImage: profileDataController.profileData.value!.images,
            // ),
          ],
        );
      },
    );
  }
}
