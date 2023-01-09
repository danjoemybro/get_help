import 'dart:ui';

import 'package:example/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onButtonPressed,
        child: const Icon(Icons.add),
        // label: const Text('Increment'),
      ),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 40, fontFeatures: [
          FontFeature.tabularFigures(),
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() => Text(controller.counter.toString())),
            const SpinningWidget(),
          ],
        ),
      ),
    );
  }
}
