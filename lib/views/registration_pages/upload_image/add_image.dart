import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_hotel_app/constants/colors.dart';
import 'package:nest_hotel_app/controllers/add_image_controller/add_image_controller.dart';

class AddImagesMain extends StatelessWidget {
  AddImagesMain({super.key});

  final AddImageController controller = Get.put(AddImageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height:MediaQuery.of(context).size.height * 0.5, 
        child:
            controller.images.isNotEmpty
                ? GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            controller.images[index],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              controller.images.removeAt(index);
                            },
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.red,
                              child: Icon(
                                Icons.close,
                                color: AppColors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
                : Center(
                  child: Text(
                    'Add Hotel Image image',
                    style: TextStyle(fontSize: 18, color: AppColors.grey),
                  ),
                ),
      ),
    );
  }
}
