import 'package:flutter/material.dart';

import 'package:get_help/get_help.dart';

import 'future_controller.dart';

class FutureView extends GetBuilderView<FutureController> {
  const FutureView({Key? key}) : super(key: key);

  @override
  Widget builder(context, controller) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.reload,
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('FutureView'),
            centerTitle: true,
          ),
          if (controller.isBusy)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: CircularProgressIndicator.adaptive(),
            )
          else if (controller.hasError)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Text(controller.error!),
                  TextButton(
                    onPressed: controller.reload,
                    child: const Text('Reload'),
                  ),
                ],
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = controller.data[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10) +
                        const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Finished Loading',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(item),
                        ],
                      ),
                    ),
                  );
                },
                childCount: controller.data.length,
              ),
            ),
        ],
      ),
    );
  }
}
