import 'package:get/get.dart';

class HomeController extends GetxController {
  final counter = 0.obs;

  void onButtonPressed() {
    counter.value++;
  }
}
