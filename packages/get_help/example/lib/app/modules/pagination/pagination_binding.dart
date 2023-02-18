import 'package:get/get.dart';

import 'pagination_controller.dart';

class PaginationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaginationController>(
      () => PaginationController(),
    );
  }
}
