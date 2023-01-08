import 'package:example/app/data/controllers/timer_controller.dart';
import 'package:get/get.dart';
import 'package:get_help/get_help.dart';

class SecondaryController extends GetxReactiveController {
  final timerController = Get.find<TimerController>();

  @override
  List<GetxController> get listenTo => [timerController];
}
