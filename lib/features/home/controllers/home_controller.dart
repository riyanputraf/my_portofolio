import 'package:get/get.dart';
import 'package:my_portofolio/constants/profile_constans.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();


  final name = ProfileConst.name.obs;
  final role = ProfileConst.role.obs;
  final skills = ProfileConst.skills.obs;
}