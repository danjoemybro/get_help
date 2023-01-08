import 'package:get/get.dart';

import 'future_controller.dart';

class FutureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FutureController>(
      () => FutureController(),
    );
  }
}
