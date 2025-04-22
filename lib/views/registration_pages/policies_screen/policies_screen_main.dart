import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/views/registration_pages/finance_legal_screen/finanace_legal_screen_main.dart';
import 'package:nest_hotel_app/views/registration_pages/policies_screen/policy_card.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registration_progress_indicator.dart';
import 'package:nest_hotel_app/views/registration_pages/widgets/registrstion_app_bar.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class PoliciesScreenMain extends StatelessWidget {
  const PoliciesScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationController = Get.find<RegistrationController>();

    return Scaffold(
      appBar: RegistrationAppBar(
        title: 'Hotel Policiesv',
        icon: Icons.policy_outlined,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              RegistrationProgressIndicator(flex1: 4, flex2: 8),
              SizedBox(height: 10),
              Text(
                'Select the policies you want to implement',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 30),

              // Policy options in cards
              Expanded(
                child: Obx(
                  () => ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      PolicyCard(
                        icon: Icons.calendar_today_outlined,
                        title: 'Free Cancellation',
                        description:
                            'Allow guests to cancel their booking up to 24 hours before check-in without any charges.',
                        isSelected:
                            registrationController.freeCancellation.value,
                        onTap:
                            () =>
                                registrationController.selectFreeCancellation(),
                      ),

                      PolicyCard(
                        icon: Icons.favorite_border,
                        title: 'Couple Friendly',
                        description:
                            'Welcome couples with valid ID proof. Perfect for romantic getaways.',
                        isSelected: registrationController.coupleFriendly.value,
                        onTap:
                            () => registrationController.selectCoupleFriendly(),
                      ),

                      PolicyCard(
                        icon: Icons.local_parking_outlined,
                        title: 'Parking Facility',
                        description:
                            'Offer convenient parking space for guests traveling with vehicles.',
                        isSelected: registrationController.parking.value,
                        onTap: () => registrationController.selectParking(),
                      ),

                      PolicyCard(
                        icon: Icons.restaurant_outlined,
                        title: 'Restaurant Inside Property',
                        description:
                            'Provide dining options within the property for guest convenience.',
                        isSelected:
                            registrationController
                                .restaurantInsideProperty
                                .value,
                        onTap:
                            () =>
                                registrationController
                                    .selectrestaurantInsideProperty(),
                      ),
                    ],
                  ),
                ),
              ),

              // Next button with counter
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Obx(() {
                  int selectedCount =
                      [
                        registrationController.freeCancellation.value,
                        registrationController.coupleFriendly.value,
                        registrationController.parking.value,
                        registrationController.restaurantInsideProperty.value,
                      ].where((element) => element).length;

                  return Column(
                    children: [
                      Text(
                        '$selectedCount of 4 policies selected',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      MyCustomButton(
                        width: double.infinity,
                        onPressed: () {
                          Get.to(
                            () => FinanceLegalScreen(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          );
                        },
                        backgroundcolor: AppColors.primary,
                        textcolor: AppColors.background,
                        text: 'Continue to Finance & Legal',
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
