import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';
import 'package:nest_hotel_app/views/rooms/room_card/room_card_feature.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class RoomCardDetailSection extends StatelessWidget {
  const RoomCardDetailSection({super.key, required this.room});

  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room Specs Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpecItem(
                icon: Icons.square_foot_outlined,
                text: '${room.roomArea} sq ft',
              ),
              VerticalDividerLine(),
              SpecItem(icon: Icons.bed_outlined, text: room.bedType),
              VerticalDividerLine(),
              SpecItem(
                icon: Icons.person_outlined,
                text: '${room.maxAdults} Adults',
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),

          // Room Features Section
          RoomFeatures(room: room),

          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: MyCustomButton(
                  onPressed: () {},
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.white,
                  text: 'view Details',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SpecItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const SpecItem({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.blue, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class VerticalDividerLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const VerticalDividerLine({
    super.key,
    this.height = 30,
    this.width = 1,
    this.color = const Color.fromARGB(100, 158, 158, 158),
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width, color: color);
  }
}
