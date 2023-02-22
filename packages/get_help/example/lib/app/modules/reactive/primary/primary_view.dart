import 'package:flutter/material.dart';
import 'package:get_help/get_help.dart';

import 'primary_controller.dart';

class PrimaryView extends GetBuilderView<PrimaryController> {
  const PrimaryView({super.key});

  @override
  Widget builder(BuildContext context, controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrimaryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.timerController.i.toString(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
