part of 'get_help.dart';

/// Why use a [GetxFutureController]? This controller type can be used to
/// change the UI when a page is loading, whether it has an error or is
/// completed. This is heavily based on the future state management found in
/// [stacked](https://pub.dev/packages/stacked) package and architecture.
///
/// **IMPORTANT:**
/// This controller will only work if using Get's simple state management
/// solution [GetBuilder]. Don't worry, you don't need to call this builder
/// widget in your code, just use the [GetBuilderView] widget for a cleaner
/// solution! 😅
///
/// To use it, add the required overridden method [futureToRun]. This method
///
/// optionally call the fields [isLoading], [hasError] and [error] inside
/// your view to make changes to your UI. Your page's state will update on
/// ```dart
/// Column(
///   children: [
///     if (controller.isBusy)
///       const CircularProgressIndicator.adaptive()
///     else if (controller.hasError)
///       Text(controller.error!)
///     else
///       const Text('Content'),
///   ],
/// ),
/// ```
abstract class GetxFutureController extends GetxReactiveController {
  bool _isLoading = true;
  bool _isReloading = false;

  /// The [isLoading] bool defaults to false but will show as true when awaiting
  /// the [futureToRun] function to complete. Once completed, this will simply
  /// toggle back to false.
  ///
  /// This can be used easily within your UI to create a loading state.
  /// ```dart
  /// Column(
  ///   children: [
  ///     if (controller.isBusy)
  ///       const CircularProgressIndicator.adaptive()
  ///     else if (controller.hasError)
  ///       Text(controller.error!)
  ///     else
  ///       const Text('Content'),
  ///   ],
  /// ),
  /// ```
  bool get isLoading => _isLoading;

  /// The [isLoading] bool defaults to false but will show as true when awaiting
  /// the [futureToRun] function to complete. Once completed, this will simply
  /// toggle back to false.
  ///
  /// This can be used easily within your UI to create a loading state.
  /// ```dart
  /// Column(
  ///   children: [
  ///     if (controller.isBusy)
  ///       const CircularProgressIndicator.adaptive()
  ///     else if (controller.hasError)
  ///       Text(controller.error!)
  ///     else
  ///       const Text('Content'),
  ///   ],
  /// ),
  /// ```
  bool get isReloading => _isReloading;

  /// Use this to get if loading or reloading as a catch all
  bool get isBusy => _isLoading || _isReloading;

  /// Toggle loading
  void setLoading([bool? isLoading]) {
    _isLoading = isLoading ?? !_isLoading;
    update();
  }

  /// Toggle Reloading!
  void setReloading([bool? isReloading]) {
    _isReloading = isReloading ?? !_isReloading;
    update();
  }

  /// The [error] value can be used within your UI to display a message when
  /// data can't be retrieved.
  String? error;

  /// Call this as a shorthand for `error != null`.
  bool get hasError => error != null;

  /// Runs a future. Whilst running, is busy will be set to true and
  ///
  /// If you want to use get_help's [error] handling, add a return a
  /// String when your future fails to show this within the UI
  Future<String?> futureToRun();

  /// Call if you want to re-run the future to run. Is busy will be set to true.
  Future<void> reload() async {
    setReloading(true);
    update();
    error = await futureToRun();
    setReloading(false);
  }

  @override
  Future<void> onInit() async {
    _isLoading = true;
    error = await futureToRun();
    _isLoading = false;
    update();

    super.onInit();
  }
}
