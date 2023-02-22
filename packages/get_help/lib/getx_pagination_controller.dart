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
abstract class GetxPaginationController extends GetxFutureController {
  // Load more?

  // scroll controller

  // love it. 
}
