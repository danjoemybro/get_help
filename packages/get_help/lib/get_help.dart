library get_help;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

part 'get_builder_view.dart';
part 'get_builder_hook_view.dart';
part 'get_hook_view.dart';
part 'getx_future_controller.dart';

class _HomeController extends GetxFutureController {
  @override
  Future<String?> futureToRun() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}

// ignore: unused_element
class _HomeView extends GetBuilderView<_HomeController> {
  const _HomeView();

  @override
  Widget builder(context, controller) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView')),
      body: Column(
        children: [
          if (controller.isBusy)
            const CircularProgressIndicator.adaptive()
          else if (controller.hasError)
            Text(controller.error!)
          else
            const Text('Content'),
        ],
      ),
    );
  }
}
