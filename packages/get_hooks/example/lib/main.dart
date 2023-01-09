import 'dart:math';

import 'package:example/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_hooks/get_hooks.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Get Hooks Example",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.dark(),
    ),
  );
}

/// A spinning widget, used by the home view to demonstrate the use of
/// a controller within a hook view.
class SpinningWidget extends GetHookView<HomeController> {
  const SpinningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Animation controller initialised without having to use vsync
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    // animation is used to change this widget's state then driven
    // to add a pleasing curve.
    final animation = useAnimation(
      animationController.drive(CurveTween(curve: Curves.easeInOut)),
    );

    // Tell the animation to endlessly repeat.
    animationController.repeat(min: 0, max: 1);

    // return a transformation widget with an Obx object within to change
    // the state of the Text widget.
    return Transform.rotate(
      angle: pi * (animation * 2),
      child: Obx(() => Text(controller.counter.toString())),
    );
  }
}
