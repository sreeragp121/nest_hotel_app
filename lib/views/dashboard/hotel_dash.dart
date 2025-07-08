import 'package:flutter/material.dart';
import 'package:nest_hotel_app/views/dashboard/grid_container/custom_card.dart';
import 'package:nest_hotel_app/views/dashboard/grid_container/pecentage.dart';
import 'package:nest_hotel_app/views/dashboard/welcome_card/welcome_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingprovider = [];

    final bookingCount = bookingprovider.length;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EnhancedWelcomeCard(),
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
                  EnhancedBookingCard(
                    icon: Icons.book,
                    iconColor: Colors.blue,
                    iconBackgroundColor: Colors.blue[100]!,
                    heading: 'Total Bookings',
                    count: bookingCount,
                    percentageChangeWidget: const PercentageChangeWidget(
                      percentageChange: 12.5,
                    ),
                    // gradient: ,
                  ),
                  EnhancedBookingCard(
                    ontap: () {
                    },
                    icon: Icons.hotel,
                    iconColor: Colors.red,
                    iconBackgroundColor: Colors.red[100]!,
                    heading: 'Available Rooms',
                    count: 1,
                  ),
                  EnhancedBookingCard(
                    icon: Icons.pie_chart,
                    iconColor: Colors.orange,
                    iconBackgroundColor: Colors.orange[100]!,
                    heading: 'Occupancy',
                    count: 156,
                    // gradient: AdminColors.occcupancycardcolor,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // const RoomStatusCard(),
              // const SizedBox(height: 24),
              // const RecentBookings(),
            ],
          ),
        ),
      ),
    );
  }
}
