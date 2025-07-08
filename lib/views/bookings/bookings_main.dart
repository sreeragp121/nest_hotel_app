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

  final HotelBookingController controller = Get.put(HotelBookingController());

  @override
  Widget build(BuildContext context) {
    controller.fetchHotelBookings();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Hotel Bookings',
          style: TextStyle(color: AppColors.primary),
        ),
        centerTitle: true,
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
