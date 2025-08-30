import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';

class SkillsStrip extends GetView<HomeController> {
  const SkillsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final skills = controller.skills;
      return Container(
        width: double.infinity,
        color: AppTheme.blackBar,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Center(
          child: Wrap(
            spacing: 28,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: skills.map((s) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  const Icon(Icons.star_rounded, size: 22, color: AppTheme.star),
                  Text(
                    s,
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
