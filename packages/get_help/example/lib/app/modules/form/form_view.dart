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
      body: Form(
        key: controller.formKey,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final field = controller.fields[index];
                    return TextFormField(
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
                    );
                  },
                  childCount: controller.fields.length,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom) +
                    const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: controller.onSubmitPressed,
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('FormView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: controller.fields.length,
          itemBuilder: (context, index) {
            final field = controller.fields[index];
            return TextFormField(
              controller: controller.textControllers[field],
              focusNode: controller.focusNodes[field],
              validator: (value) {
                return 'Nope';
              },
              decoration: InputDecoration(
                label: Text(field.name.capitalize!),
              ),
            );
          },
        ),
      ),
    );
  }
}
