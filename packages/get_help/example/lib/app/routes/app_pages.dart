import 'package:get/get.dart';

import '../modules/future/future_binding.dart';
import '../modules/future/future_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/pagination/pagination_binding.dart';
import '../modules/pagination/pagination_view.dart';
import '../modules/reactive/primary/primary_binding.dart';
import '../modules/reactive/primary/primary_view.dart';
import '../modules/reactive/reactive_binding.dart';
import '../modules/reactive/reactive_view.dart';
import '../modules/reactive/secondary/secondary_binding.dart';
import '../modules/reactive/secondary/secondary_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REACTIVE,
      page: () => const ReactiveView(),
      binding: ReactiveBinding(),
      children: [
        GetPage(
          name: _Paths.PRIMARY,
          page: () => const PrimaryView(),
          binding: PrimaryBinding(),
        ),
        GetPage(
          name: _Paths.SECONDARY,
          page: () => const SecondaryView(),
          binding: SecondaryBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.FUTURE,
      page: () => const FutureView(),
      binding: FutureBinding(),
    ),
    GetPage(
      name: _Paths.PAGINATION,
      page: () => const PaginationView(),
      binding: PaginationBinding(),
    ),
  ];
}
