import 'package:example/app/data/controllers/timer_controller.dart';
import 'package:get/get.dart';

import 'reactive_controller.dart';

class ReactiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReactiveController>(
      () => ReactiveController(),
    );
    Get.lazyPut(() => TimerController());
  }
}
