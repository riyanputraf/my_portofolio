import 'package:get/get.dart';

class CertificationsController extends GetxController {
  final showAll = false.obs;

  void toggle() => showAll.toggle();
}
