import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:get_help/get_help.dart';

enum FormField { amount, title, description }

// Set default values
class FormController extends GetxFormController<FormField> {
  @override
  List<FormField> get fields => FormField.values;

  @override
  Map<FormField, String> get defaultValues =>
      {FormField.description: 'Lovers!'};

  Future<void> onSubmitPressed() async {
    if (formKey.currentState!.validate()) {
      // Form is valid, show a snackbar
      scaffoldMessengerKey.currentState?.clearSnackBars();
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text('Your form is valid!')),
      );
    }
  }
}
