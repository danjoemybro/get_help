import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.onSubmitPressed,
        label: const Text('Submit'),
        icon: const Icon(Icons.done),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: controller.fields.length,
          itemBuilder: (context, index) {
            final field = controller.fields[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextFormField(
                controller: controller.textControllers[field],
                focusNode: controller.focusNodes[field],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(field.name.capitalize!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
