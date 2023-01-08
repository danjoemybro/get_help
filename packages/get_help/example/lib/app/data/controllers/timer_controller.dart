import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  late final Timer timer;

  int i = 0;
  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      i++;
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
