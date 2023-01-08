import 'package:example/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_help/get_help.dart';

import 'reactive_controller.dart';

class ReactiveView extends GetBuilderView<ReactiveController> {
  const ReactiveView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReactiveView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'The counter you see below you changes state at exactly the same time as the two other subpages. The state is controlled by the TimerController which all of these pages are listening to. This is achieved by using the GetxReactiveView.',
            ),
            // const SizedBox(height: 20),
            Text(
              controller.timerController.i.toString(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.PRIMARY),
              child: const Text('Primary Subpage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.SECONDARY),
              child: const Text('Secondary Subpage'),
            ),
          ],
        ),
      ),
    );
  }
}
