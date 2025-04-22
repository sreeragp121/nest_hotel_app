import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/build_section_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/faciltity_chip.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/image_tile.dart';
import 'package:nest_hotel_app/views/registration_pages/final_review_page/widgets/info_card.dart';

class DetailFinalReviewCard extends StatelessWidget {
  const DetailFinalReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Basic Information'),
        InfoCard(title: 'Hotel Type', value: controller.accommodationType),
        // InfoCard(title: 'Base Price', value: ),
        InfoCard(
          title: 'Hotel Name',
          value: controller.stayNameController.text,
        ),
        InfoCard(title: 'Booking Since', value: controller.selectedYear),
        const SectionTitle(title: 'Contact Details'),
        InfoCard(
          title: 'contact_number',
          value: controller.contactNumberController.text,
        ),
        InfoCard(
          title: 'email_address',
          value: controller.emailController.text,
        ),
        const SectionTitle(title: 'Location'),
        InfoCard(title: 'City', value: controller.cityController.text),
        InfoCard(title: 'State', value: controller.stateController.text),
        InfoCard(title: 'Country', value: controller.countryController.text),
        InfoCard(title: 'Pincode', value: controller.pincodeController.text),
        const SectionTitle(title: 'Legal Information'),
        InfoCard(
          title: 'PAN number',
          value: controller.panNumberController.text,
        ),
        InfoCard(
          title: 'Property Number',
          value: controller.propertyNumberController.text,
        ),
        InfoCard(
          title: 'GST Number',
          value: controller.gstNumberController.text,
        ),
        const SectionTitle(title: 'Facilities & Features'),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FacilityChip(title: 'Leased', value: true),
            FacilityChip(
              title: 'Registered',
              value: false,
              
            ),
            FacilityChip(
              title: 'Free Cancellation',
    
              value: controller.freeCancellation.value,
            ),
            FacilityChip(
              title: 'Couple Friendly',
              value: controller.coupleFriendly.value,
            ),
            FacilityChip(
              title: 'Parking Available',
              value: controller.parking.value,
            ),
            FacilityChip(
              title: 'Restaurant',
              value: controller.restaurantInsideProperty.value,
            ),
          ],
        ),
        const SectionTitle(title: 'Hotel Images'),
        const ImageListView(),
      ],
    );
  }
}
