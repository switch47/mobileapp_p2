// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../controllers/cart_controller.dart';
// import '../controllers/product_controller.dart';
//
// class CartTotal extends StatelessWidget {
//   final ProductController controller = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 75),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Total',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               '${controller.total}',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               )
//             )
//           ],
//         )
//       ),
//     );
//   }
//
// }