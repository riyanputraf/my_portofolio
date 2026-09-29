import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final sectionKeys = List.generate(6, (_) => GlobalKey());
  final activeSection = 0.obs;

  bool _trackingScheduled = false;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scheduleActiveSectionUpdate);
  }

  void _scheduleActiveSectionUpdate() {
    if (_trackingScheduled) return;
    _trackingScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackingScheduled = false;
      if (!isClosed) _updateActiveSection();
    });
  }

  void _updateActiveSection() {
    var active = 0;
    for (var index = 0; index < sectionKeys.length; index++) {
      final box = sectionKeys[index].currentContext?.findRenderObject();
      if (box is RenderBox && box.localToGlobal(Offset.zero).dy < 200) {
        active = index;
      }
    }
    if (scrollController.hasClients && scrollController.position.extentAfter < 40) {
      active = sectionKeys.length - 1;
    }
    activeSection.value = active;
  }

  void goToSection(int index, {required bool disableAnimations}) {
    final target = sectionKeys[index].currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: disableAnimations ? Duration.zero : const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void onClose() {
    scrollController.removeListener(_scheduleActiveSectionUpdate);
    scrollController.dispose();
    super.onClose();
  }
}
