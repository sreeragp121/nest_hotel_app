import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/textfield_controller.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_email_auth.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_heading.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_page_phone_auth.dart';
import 'package:nest_hotel_app/views/auths/login_page/login_using.dart';

class LogInPageMain extends StatelessWidget {
  const LogInPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(MyTextfieldController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); 
          },
          behavior: HitTestBehavior.translucent,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LoginPageHeading(),
                    const TabBar(
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      tabs: [
                        Tab(
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 450),
                      child: TabBarView(
                        children: [LoginPageEmailAuth(), LoginPagePhoneAuth()],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const LoginUsing(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
