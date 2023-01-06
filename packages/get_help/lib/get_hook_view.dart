part of 'get_help.dart';

/// Do you like flutter hooks? Well I do! It may well not be seen as best
/// practice to use it within an app that already incorporates Getx but there
/// are some benefits. Flutter hooks is especially good for creating and
/// managing animation controllers as well as tab controllers. Any controller
/// that requires `vsync` can be a pain to create within you controller. 
/// So don't: Use flutter hooks!
abstract class GetHookView<T extends GetxController> extends HookWidget {
  const GetHookView({super.key});

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}
