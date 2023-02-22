part of 'get_help.dart';

/// Why use a [GetxFutureController]? This controller type can be used to
abstract class GetxFormController<T> extends GetxFutureController {
  /// The form key used for input validation
  GlobalKey<FormState> get formKey => _formKey;
  final _formKey = GlobalKey<FormState>();

  /// The controllers for all fields use as:
  /// ```dart
  /// controller.textControllers[MyField];
  /// ```
  Map<T, TextEditingController> get textControllers => _textControllers;
  final Map<T, TextEditingController> _textControllers = {};

  /// The Focus Nodes for all fields use as:
  /// ```dart
  /// controller.textControllers[MyField];
  /// ```
  Map<T, FocusNode> get focusNodes => _focusNodes;
  final Map<T, FocusNode> _focusNodes = {};

  /// Your enums you want to use,
  List<T> get fields;

  /// Set your default values here! Only called on initial load
  Map<T, String> get defaultValues => {};

  @override
  Future<void> onInit() {
    // For each field
    for (final field in fields) {
      // Set text controllers
      _textControllers[field] = TextEditingController(
        // Set the default values if they exist
        text: defaultValues[field],
      );

      // Set focus Nodes
      _focusNodes[field] = FocusNode();
    }
    return super.onInit();
  }

  @override
  void dispose() {
    // Dispose Text Controllers
    for (final textController in _textControllers.values) {
      textController.dispose();
    }

    // Dispose Focus Nodes
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }

    super.dispose();
  }

  /// Set so you don't need to use a future to run, but the user has the
  /// option to.
  @override
  Future<String?> futureToRun() async => null;
}
