import 'package:example/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_help/get_help.dart';

import 'home_controller.dart';

class HomeView extends GetBuilderView<HomeController> {
  const HomeView({super.key});

  @override
  Widget builder(context, controller) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 280,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.REACTIVE),
            child: const Text('Reactive Page'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.FUTURE),
            child: const Text('Future Page'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.FORM),
            child: const Text('Form Page'),
          ),
        ],
      ),
    );
  }
}
