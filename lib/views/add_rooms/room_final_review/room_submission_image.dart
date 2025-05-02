// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nest_hotel_app/constants/colors.dart';
// import 'package:nest_hotel_app/controllers/room_controller/room_controller.dart';

// class RoomSubmissionImage extends StatelessWidget {
//   const RoomSubmissionImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final RoomController roomController = Get.find<RoomController>();

//     return Obx(() {
//       final roomImageUrls = roomController.roomImageUrls;

//       return SizedBox(
//         height: 150,
//         child:
//             roomImageUrls.isEmpty
//                 ? const Center(child: Text('No images uploaded yet.'))
//                 : ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: roomImageUrls.length,
//                   itemBuilder: (context, index) {
//                     final url = roomImageUrls[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.network(
//                           url,
//                           width: 120,
//                           height: 120,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return const Icon(
//                               Icons.error,
//                               size: 120,
//                               color: AppColors.red,
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//       );
//     });
//   }
// }
