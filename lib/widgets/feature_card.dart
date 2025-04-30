import 'package:flutter/material.dart';
import 'package:nest_hotel_app/models/room_models/room_model.dart';

class RoomFeatures extends StatelessWidget {
  final RoomModel room;

  const RoomFeatures({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        FeatureItem(
          icon: Icons.square_foot,
          label: '${room.propertySize} sqft',
        ),
        // FeatureItem(
        //   icon: Icons.person,
        //   label: '${room.numberOfExtraAdultsAllowed} Extra Adults',
        // ),
        // FeatureItem(
        //   icon: Icons.child_care,
        //   // label: '${room.numberOfExtraChildAllowed} Children',
        // ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF1E91B6)),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
