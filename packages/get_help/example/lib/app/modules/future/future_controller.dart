import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get_help/get_help.dart';

class FutureController extends GetxFutureController {
  late List<String> data;

  final _rand = Random();

  @override
  Future<String?> futureToRun() async {
    try {
      // This is a simple simulation of waiting for an api call
      await Future.delayed(const Duration(seconds: 2));

      // this is a simulated response
      data = List.generate(_rand.nextInt(5) + 2, (index) {
        return lorem(paragraphs: 1, words: _rand.nextInt(30) + 10);
      });

      // To simulate an error, just do this:

    } catch (e) {
      return e.toString();
    }

    return null;
  }

  Future<void> reload() async {
    setBusy(true);
    await futureToRun();
    setBusy(false);
  }
}
