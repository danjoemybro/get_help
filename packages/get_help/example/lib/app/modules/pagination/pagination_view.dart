import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'pagination_controller.dart';

class PaginationView extends GetView<PaginationController> {
  const PaginationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaginationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaginationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
