part of 'get_help.dart';

/// GetBuilderView is a great way to create a view with GetBuilder simple state management.
///
/// IMPORTANT:
/// This widgets expects that you have already initialised your controller using a binding.
/// If you a re not using bindings or you need to turn on local controller creation.
/// ```dart
/// @override
/// MyController? get init => MyController();
/// ```
///
/// Basically, GetBuilderView acts as a shorthand for this:
///
/// ```dart
/// class MyView extends StatelessWidget {
///   const MyView({super.key});
///
///   @override
///   Widget build(context) {
///     return GetBuilder<MyController>(
///       init: MyController(),
///       builder: (controller) {
///         return const Scaffold();
///       },
///     );
///   }
/// }
/// ```
///
/// Instead of this nested code, all you need to write is this:
///
/// ```dart
/// class MyView extends GetBuilderView<MyController> {
///   const MyView({super.key});
///
///   @override
///   Widget builder(context, controller) {
///     return const Scaffold();
///   }
/// }
/// ```
///
abstract class GetBuilderView<T extends GetxController> extends GetView<T> {
  /// Constructor
  const GetBuilderView({super.key});

  /// Wether your widget should have one global controller or should create its own.
  /// Defaults to true
  bool get global => true;

  /// This is where a controller can be initialised.
  /// If the same controller has already been initialised by another GetBuilderView
  /// or GetBuilder widget, return null and no new controller will be created.
  T? get init => null;

  /// This function replaces the build method.
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
