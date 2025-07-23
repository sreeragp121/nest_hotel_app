import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/bookins_controller/booking_controller.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';
import 'package:nest_hotel_app/views/dashboard/grid_container/custom_card.dart';
import 'package:nest_hotel_app/views/dashboard/welcome_card/welcome_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomControllerNew roomController = Get.put(RoomControllerNew());
    final HotelBookingController bookingsController = Get.put(
      HotelBookingController(),
    );

    bookingsController.getTodayBookings();
    bookingsController.calculateTotalRevenue();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EnhancedWelcomeCard(),
                SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1.1,
                  ),
                  children: [
                    Obx(() {
                      return EnhancedBookingCard(
                        icon: Icons.book,
                        iconColor: AppColors.blue,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.blue.withAlpha(30),
                            AppColors.blue.withAlpha(70),
                          ],
                        ),
                        iconBackgroundColor: Colors.blue[100]!,
                        heading: 'Today Bookings',
                        count: bookingsController.todayBoookings.length,
                      );
                    }),
                    Obx(
                      () => EnhancedBookingCard(
                        ontap: () {},
                        icon: Icons.hotel,
                        iconColor: AppColors.red,
                        iconBackgroundColor: AppColors.red.withAlpha(80),
                        heading: 'Available Rooms',
                        count: roomController.roomList.length,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.red.withAlpha(20),
                            AppColors.red.withAlpha(60),
                          ],
                        ),
                      ),
                    ),
                    EnhancedBookingCard(
                      icon: Icons.currency_rupee,
                      iconColor: AppColors.green,
                      iconBackgroundColor: AppColors.green.withAlpha(100),
                      heading: 'Total Revenue',
                      count: bookingsController.totalRevenue.toInt(),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.green.withAlpha(40),
                          AppColors.green.withAlpha(80),
                        ],
                      ),
                    ),

                    EnhancedBookingCard(
                      icon: Icons.pie_chart,
                      iconColor: AppColors.orange,
                      iconBackgroundColor: AppColors.orange.withAlpha(100),
                      heading: 'Occupancy',
                      count: 156,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.orange.withAlpha(10),
                          AppColors.orange.withAlpha(80),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
