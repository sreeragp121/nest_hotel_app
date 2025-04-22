import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:nest_hotel_app/constants/colors.dart';

class MyCustomSnackBar {
  static void show({
    required String title,
    required String message,
    IconData icon = Icons.info_rounded,
    Color iconColor = AppColors.white,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
    Color accentColor = AppColors.black,
    Color backgroundColor = AppColors.green,
    Color textColor = AppColors.white,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        duration: duration,
        snackPosition: position,
        margin: const EdgeInsets.all(16),
        borderRadius: 16,
        backgroundColor: AppColors.transparent,
        isDismissible: true,
        padding: EdgeInsets.zero,
        messageText: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(40),
                blurRadius: 16,
                offset: const Offset(0, 4),
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: accentColor.withAlpha(50),
                    width: 1.5,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      backgroundColor.withAlpha(160),
                      backgroundColor.withAlpha(120),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: accentColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: iconColor, size: 24),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message,
                              style: TextStyle(
                                color: textColor.withAlpha(220),
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (Get.isSnackbarOpen) {
                            Get.back();
                          }
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: textColor.withAlpha(180),
                          size: 20,
                        ),
                        splashRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
