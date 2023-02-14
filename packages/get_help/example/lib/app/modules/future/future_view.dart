import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_help/get_help.dart';

import 'future_controller.dart';

class FutureView extends GetBuilderView<FutureController> {
  const FutureView({Key? key}) : super(key: key);

  @override
  Widget builder(context, controller) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.refreshController.callRefresh,
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
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
          else ...[
            CupertinoSliverRefreshControl(
              onRefresh: controller.onInit,
            ),
            // const HeaderLocator.sliver(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = controller.data![index];
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
                childCount: controller.data!.length,
              ),
            ),
          ],
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 50,
            ),
          ),
        ],
      ),
      // body: EasyRefresh(
      //   controller: controller.refreshController,
      //   header: const MaterialHeader(
      //     position: IndicatorPosition.locator,
      //     clamping: false,
      //     safeArea: false,
      //   ),
      //   onRefresh: controller.onInit,
      //   child: CustomScrollView(
      //     slivers: [
      //       const SliverAppBar(
      //         pinned: true,
      //         title: Text('FutureView'),
      //         centerTitle: true,
      //       ),
      //       if (controller.isBusy)
      //         const SliverFillRemaining(
      //           hasScrollBody: false,
      //           child: CircularProgressIndicator.adaptive(),
      //         )
      //       else if (controller.hasError)
      //         SliverFillRemaining(
      //           hasScrollBody: false,
      //           child: Column(
      //             children: [
      //               Text(controller.error!),
      //               TextButton(
      //                 onPressed: controller.reload,
      //                 child: const Text('Reload'),
      //               ),
      //             ],
      //           ),
      //         )
      //       else ...[
      //         // SliverRefreshControl(
      //         //   onRefresh: controller.onInit,
      //         // ),
      //         const HeaderLocator.sliver(),
      //         SliverList(
      //           delegate: SliverChildBuilderDelegate(
      //             (context, index) {
      //               final item = controller.data![index];
      //               return Card(
      //                 margin: const EdgeInsets.symmetric(horizontal: 10) +
      //                     const EdgeInsets.only(top: 10),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(10.0),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.stretch,
      //                     children: [
      //                       Text(
      //                         'Finished Loading',
      //                         style: Theme.of(context).textTheme.titleMedium,
      //                       ),
      //                       Text(item),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             },
      //             childCount: controller.data!.length,
      //           ),
      //         ),
      //       ],
      //       SliverPadding(
      //         padding: EdgeInsets.only(
      //           bottom: MediaQuery.of(context).padding.bottom + 50,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
