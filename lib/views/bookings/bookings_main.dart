import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/bookins_controller/booking_controller.dart';
import 'package:nest_hotel_app/views/bookings/booking_card/booking_card.dart';
import 'package:nest_hotel_app/views/bookings/booking_details/booking_details_main.dart';

class BookingsMain extends StatelessWidget {
  const BookingsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HotelBookingPage()));
  }
}

class HotelBookingPage extends StatelessWidget {
  HotelBookingPage({super.key});

  final HotelBookingController controller = Get.find<HotelBookingController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.event_note, size: 24, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Booking Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              'View and manage guest bookings',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.7 * 255).toInt()),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.bookings.isEmpty) {
            return const Center(child: Text('No bookings found.'));
          }

          return ListView.builder(
            itemCount: controller.bookings.length,
            itemBuilder: (context, index) {
              final booking = controller.bookings[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BookingDetailsPage(booking: booking),
                    ),
                  );
                },
                child: BookingsCard(booking: booking),
              );
            },
          );
        }),
      ),
    );
  }
}
