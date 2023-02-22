import 'package:get_help/get_help.dart';

enum FormField { amount, title, description }

// Set default values
class FormController extends GetxFormController<FormField> {
  @override
  List<FormField> get fields => FormField.values;

  @override
  Map<FormField, String> get defaultValues =>
      {FormField.description: 'Lovers!'};

  void onSubmitPressed() {
    if (formKey.currentState!.validate()) {
      // Form is valid
    }
  }
}
