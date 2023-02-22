library get_help;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'get_builder_view.dart';
part 'getx_future_controller.dart';
part 'getx_reactive_controller.dart';
part 'getx_pagination_controller.dart';
part 'getx_form_controller.dart';

// class _HomeController extends GetxFutureController {
//   @override
//   Future<String?> futureToRun() async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//     } catch (e) {
//       return e.toString();
//     }
//     return null;
//   }
// }

// class _HomeView extends GetBuilderView<_HomeController> {
//   const _HomeView();

//   @override
//   Widget builder(context, controller) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('HomeView')),
//       body: Column(
//         children: [
//           if (controller.isBusy)
//             const CircularProgressIndicator.adaptive()
//           else if (controller.hasError)
//             Text(controller.error!)
//           else
//             const Text('Content'),
//         ],
//       ),
//     );
//   }
// }
