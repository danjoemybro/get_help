import 'package:get/get.dart';

import 'primary_controller.dart';

class PrimaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrimaryController>(
      () => PrimaryController(),
    );
  }
}
