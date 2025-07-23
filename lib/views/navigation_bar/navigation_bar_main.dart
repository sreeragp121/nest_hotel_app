import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/navigation_bar_controller/my_navigation_bar_controller.dart';
import 'package:nest_hotel_app/views/bookings/bookings_main.dart';
import 'package:nest_hotel_app/views/dashboard/hotel_dash.dart';
import 'package:nest_hotel_app/views/profile/profile_page_main.dart';
import 'package:nest_hotel_app/views/reviews/reviews_main.dart';
import 'package:nest_hotel_app/views/rooms/rooms_main.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});
  final myBottomNavigationBarController = Get.put(MyNavigationBarController());

  @override
  Widget build(BuildContext context) {
    List pages = [
      BookingsMain(),
      RoomsMain(),
      DashboardPage(),
      ReviewsMain(),
      // UserProfileScreen(),
      AccountPageMain()
    ];
    return Scaffold(
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: pages[myBottomNavigationBarController.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => SnakeNavigationBar.color(
          height: 70,
          backgroundColor: AppColors.primary.withAlpha(220),
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: const EdgeInsets.all(12),
          snakeViewColor: AppColors.white,
          selectedItemColor:AppColors.primary,
          unselectedItemColor: AppColors.white,
          showUnselectedLabels: true,
          showSelectedLabels: false,

          /// Bind currentIndex with reactive variable
          currentIndex: myBottomNavigationBarController.selectedIndex.value,

          onTap: (value) {
            myBottomNavigationBarController.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.event, size: 25),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.hotel, size: 25),
              label: 'Rooms',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, size: 25),
              label: 'Reviews',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
