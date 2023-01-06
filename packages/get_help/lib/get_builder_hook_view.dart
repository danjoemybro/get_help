part of 'get_help.dart';

/// A hook widget
abstract class GetBuilderHookView<T extends GetxController>
    extends GetHookView<T> {
  /// Constructor
  const GetBuilderHookView({super.key});

  /// Wether your widget should have one global controller or should create its own.
  /// Defaults to true
  bool get global => true;

  /// This is where a controller can be initialised.
  /// If the same controller has already been initialised by another GetBuilderView
  /// or GetBuilder widget, return null and no new controller will be created.
  T? get init => null;

  /// A function that builds the UI to be shown from the ViewModel - Required
  Widget builder(BuildContext context, T controller);

  @override
  @protected
  Widget build(BuildContext context) {
    if (!global) {
      assert(
        init != null,
        'The init method must be defined if using local state with a get builder widget.',
      );
    }

    return GetBuilder<T>(
      builder: (controller) => builder(context, controller),
      init: init,
      global: global,
    );
  }
}
