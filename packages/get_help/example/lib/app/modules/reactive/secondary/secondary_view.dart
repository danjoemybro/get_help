import 'package:flutter/material.dart';
import 'package:get_help/get_help.dart';

import 'secondary_controller.dart';

class SecondaryView extends GetBuilderView<SecondaryController> {
  const SecondaryView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondaryView'),
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
