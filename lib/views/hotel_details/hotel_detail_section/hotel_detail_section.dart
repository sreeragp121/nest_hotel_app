import 'package:flutter/material.dart';
import 'package:nest_hotel_app/models/hotel_model.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_detail_section/hotel_description.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_detail_section/hotel_header_section.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_detail_section/hotel_location_card.dart';
import 'package:nest_hotel_app/views/hotel_details/hotel_detail_section/hotel_price_tag.dart';


class HotelDetailSection extends StatelessWidget {
  final HotelModel hotelData;
  const HotelDetailSection({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Section
          SectionHeaderWidget(
            title: 'About the Hotel',
            icon: Icons.info_outline,
          ),
          const SizedBox(height: 12),
          HotelDescriptionWidget(description: hotelData.hotelDescription),

          const SizedBox(height: 24),

          // Price Section
          SectionHeaderWidget(
            title: 'Starting Price',
            icon: Icons.currency_rupee,
          ),
          const SizedBox(height: 12),
          PriceTagWidget(basePrice: hotelData.basePrice),

          const SizedBox(height: 24),

          // Address Section
          SectionHeaderWidget(
            title: 'Location',
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 12),
          LocationCardWidget(
            city: hotelData.city,
            state: hotelData.state,
            country: hotelData.country,
          ),
        ],
      ),
    );
  }
}


