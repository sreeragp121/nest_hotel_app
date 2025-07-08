import 'package:flutter/material.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/views/profile/account_tile_card.dart';
import 'package:nest_hotel_app/views/profile/profile_page_main.dart';

class AccPageMoreOptions extends StatelessWidget {
  const AccPageMoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          'More',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              TileSection(
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                leadicon: Icons.person,
                title: 'Contact Us',
                subtitle: 'Make changes to your account',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
              TileSection(
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SampleScreen()),
                  );
                },
                leadicon: Icons.share,
                title: 'FAQs',
                subtitle: 'Frequently asked questions',
                trailicon: Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
