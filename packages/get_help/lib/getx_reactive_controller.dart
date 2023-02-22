part of 'get_help.dart';

/// TODO Write Documentation
abstract class GetxReactiveController extends GetxController {
  /// List of controllers to react to
  List<GetxController> get listenTo => [];

  @override
  void onInit() {
    for (final controller in listenTo) {
      controller.addListener(update);
    }

    super.onInit();
  }

  @override
  void onClose() {
    for (final controller in listenTo) {
      controller.removeListener(update);
    }

    super.onClose();
  }
}
