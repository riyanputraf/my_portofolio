import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class EducationSection extends GetView<HomeController> {
  const EducationSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
        color: const Color(0xFFF2F1F6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionTitle(
              eyebrow: '05 / The foundation', title: 'Learning that lasts.'),
          const SizedBox(height: 32),
          Obx(() => Column(
              children: controller.education
                  .map((data) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: EducationCard(data: data),
                      ))
                  .toList())),
        ]),
      );
}
