import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/registration_controllers/registration_controller.dart';
import 'package:nest_hotel_app/widgets/my_button.dart';

class FinalVerificationPage extends StatelessWidget {
  final controller = Get.find<RegistrationController>();
  final List<String> verificationItems = [
    'Hotel GST Details (Optional)',
    'Cancelled Check',
    'PAN Card',
    'Channel Manager Details (Optional)',
    'PMS Details (Property Management System) (Optional)',
    'Lease Agreement (If Property on lease)',
    'Licence',
  ];

  FinalVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Verification'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Final verification will be done through a third party. Please till proper information',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'We (i.e) OTAs can send e-mail with agreement copy With terms and conditions',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'What is mandatory for verification?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: verificationItems.length,
                itemBuilder: (context, index) {
                  return Text('• ${verificationItems[index]}');
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: MyCustomButton(
                onPressed: () {
                  // Get.to(() => RegWatingScreen());
                  controller.submit();
                },
                backgroundcolor: AppColors.primary,
                textcolor: AppColors.white,
                text: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
