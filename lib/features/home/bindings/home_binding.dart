import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/certifications_controller.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/controllers/projects_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new);
    Get.lazyPut(ProjectsController.new);
    Get.lazyPut(CertificationsController.new);
  }
}
