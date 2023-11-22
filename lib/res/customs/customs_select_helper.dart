// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../utils/styles.dart';
//
// class CustomsHelper {
//   void selectPhotos(customController) => Get.defaultDialog(
//       title: 'Select Image',
//       titleStyle: Style.alltext_block_text_style,
//       content: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextButton(
//             onPressed: () {
//               customController.selectImages("gallery");
//             },
//             child: SvgPicture.asset(
//               "assets/images/galleryIcon.svg",
//               width: Get.size.height * .05,
//               height: Get.size.height * .05,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Style.widthdistan_size10,
//           TextButton(
//             onPressed: () {
//               customController.selectImages("camera");
//             },
//             child: SvgPicture.asset(
//               "assets/images/cameraIcon.svg",
//               width: Get.size.height * .05,
//               height: Get.size.height * .05,
//               fit: BoxFit.fill,
//             ),
//           ),
//         ],
//       ),
//       radius: 10.0);
// }
