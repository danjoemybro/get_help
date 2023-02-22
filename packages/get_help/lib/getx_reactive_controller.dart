part of 'get_help.dart';

/// The base reactive controller!
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
  void dispose() {
    for (final controller in listenTo) {
      controller.removeListener(update);
    }

    super.dispose();
  }
}
