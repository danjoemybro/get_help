part of 'get_hooks.dart';

/// A GetView widget with the ability to use hooks from the
/// [flutter_hooks](https://pub.dev/packages/flutter_hooks) package.
abstract class GetHookView<T extends GetxController> extends HookWidget {
  /// Constructor
  const GetHookView({super.key});

  /// This tag comes from the GetView widget. It can be used to add a tag
  /// to your controller.
  final String? tag = null;

  /// The getter for your controller to be used by this page. If the controller
  ///  has been initialised with get yet, the controller will be created.
  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}
