import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/room_controller/room_controller_new.dart';

class RoomInfoDetailCard extends StatelessWidget {
  final int index;
  final RoomControllerNew roomController;
  const RoomInfoDetailCard({
    super.key,
    required this.index,
    required this.roomController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Theme.of(context).cardColor, Theme.of(context).cardColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Room Type',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.grey600),
                        ),
                        const SizedBox(height: 4.0),
                        Obx(
                          () => Text(
                            roomController.roomList[index].roomType,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => Text(
                            roomController.roomList[index].roomTypeDescription,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.apartment,
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const Divider(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room Area',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              roomController.roomList[index].roomArea
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            ' ft',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.grey600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room Size',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              roomController.roomList[index].propertySize
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            ' ft',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.grey600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Obx(
                        () => Text(
                          roomController.roomList[index].basePrice.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bed Type',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              roomController.roomList[index].bedType
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adults',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              roomController.roomList[index].maxAdults
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Childrens',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.grey600),
                      ),
                      const SizedBox(height: 4.0),
                      Obx(
                        () => Text(
                          roomController.roomList[index].maxChildren.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
