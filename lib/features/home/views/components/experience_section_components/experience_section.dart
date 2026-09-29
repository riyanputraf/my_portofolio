import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/experience_section_components/experience_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class ExperienceSection extends GetView<HomeController> {
  const ExperienceSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
        color: const Color(0xFFF2F1F6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionTitle(
              eyebrow: '03 / My journey',
              title: 'Experience, built over time.'),
          const SizedBox(height: 32),
          Obx(() => Column(
              children: controller.experiences
                  .map((data) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ExperienceCard(data: data),
                      ))
                  .toList())),
        ]),
      );
}
