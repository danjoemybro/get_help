import 'package:get/get.dart';

import 'secondary_controller.dart';

class SecondaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondaryController>(
      () => SecondaryController(),
    );
  }
}
