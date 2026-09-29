import 'package:get/get.dart';
import 'package:my_portofolio/configs/routes/app_routes.dart';
import 'package:my_portofolio/features/home/bindings/home_binding.dart';
import 'package:my_portofolio/features/home/views/ui/home_view.dart';

abstract final class AppPages {
  static final pages = <GetPage<void>>[
    GetPage(
      name: Routes.home,
      page: HomePage.new,
      binding: HomeBinding(),
    ),
  ];
}
