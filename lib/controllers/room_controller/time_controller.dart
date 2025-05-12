import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nest_hotel_app/constants/colors.dart';

class TimeController extends GetxController {
  Rx<TimeOfDay?> checkInTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> checkOutTime = Rx<TimeOfDay?>(null);

  void pickTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          isCheckIn
              ? (checkInTime.value ?? TimeOfDay.now())
              : (checkOutTime.value ?? TimeOfDay.now()),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      if (isCheckIn) {
        checkInTime.value = picked;
      } else {
        checkOutTime.value = picked;
      }
    }
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return "-- : --";
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }


  void resetTimes() {
   
    checkInTime.value = TimeOfDay(
      hour: 12,
      minute: 0,
    );
    checkOutTime.value = TimeOfDay(
      hour: 12,
      minute: 0,
    ); 
  }
}
