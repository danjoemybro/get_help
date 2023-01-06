part of 'get_help.dart';

abstract class GetHookView<T extends GetxController> extends HookWidget {
  const GetHookView({super.key});

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}
