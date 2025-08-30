import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_card.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class EducationSection extends GetView<HomeController> {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    const maxW = 1200.0;

    return Container(
      color: const Color(0xFFF6F7F9),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(eyebrow: 'Academic Journey', title: 'My Education'),
              const SizedBox(height: 20),
              Obx(() => Column(
                    children: controller.education
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: EducationCard(data: e),
                            ))
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
