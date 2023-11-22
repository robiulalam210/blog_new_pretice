// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../utils/colors_code.dart';
// import '../utils/dimensions.dart';
// import '../utils/styles.dart';
//
// void showCustomSnackBar(String message, isError) {
//   Get.showSnackbar(GetSnackBar(
//     backgroundColor: isError
//         ? ColorsCode.snackbar_error_color
//         : ColorsCode.snackbar_success_color,
//     message: message,
//     maxWidth: Dimensions.WEB_MAX_WIDTH,
//     duration: const Duration(seconds: 2),
//     snackStyle: SnackStyle.FLOATING,
//     snackPosition: SnackPosition.TOP,
//     margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//     borderRadius: Dimensions.RADIUS_SMALL,
//     isDismissible: true,
//     dismissDirection: DismissDirection.horizontal,
//   ));
// }
//
// void showCustomSnackBarUpComing(String message, isError) {
//   Get.showSnackbar(GetSnackBar(
//     backgroundColor: isError
//         ? ColorsCode.snackbar_error_color
//         : ColorsCode.snackbar_upcoming_success_color,
//     message: message,
//     maxWidth: Dimensions.WEB_MAX_WIDTH,
//     duration: const Duration(seconds: 2),
//     snackStyle: SnackStyle.FLOATING,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//     borderRadius: Dimensions.RADIUS_SMALL,
//     isDismissible: true,
//     dismissDirection: DismissDirection.horizontal,
//   ));
// }
//
// void showCustomExitbutton(String message, isError) {
//   Get.showSnackbar(
//     GetSnackBar(
//       backgroundColor: isError
//           ? ColorsCode.snackbar_error_color
//           : ColorsCode.snackbar_success_color,
//       message: message,
//       maxWidth: Dimensions.WEB_MAX_WIDTH,
//       duration: const Duration(seconds: 5),
//       snackStyle: SnackStyle.FLOATING,
//       margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//       borderRadius: Dimensions.RADIUS_SMALL,
//       isDismissible: true,
//       snackPosition: SnackPosition.BOTTOM,
//       dismissDirection: DismissDirection.horizontal,
//       mainButton: Column(
//         children: [
//           TextButton(
//               onPressed: () => exit(0),
//               child: const Text(
//                 'Yes',
//                 style: Style.robotoRegular,
//               ))
//         ],
//       ),
//     ),
//   );
// }
