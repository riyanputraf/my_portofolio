import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certificate_card.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class CertificationsSection extends GetView<HomeController> {
  const CertificationsSection({super.key});

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
              const SectionTitle(eyebrow: 'Proving My Expertise', title: 'Achievements & Certifications'),
              const SizedBox(height: 20),
              LayoutBuilder(builder: (_, c) {
                final w = c.maxWidth;
                final cross = w >= 1100 ? 3 : (w >= 720 ? 2 : 1);
                final ratio = w >= 1100 ? 1.15 : (w >= 720 ? 1.10 : 1.05);

                return Obx(() => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cross,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: ratio,
                      ),
                      itemCount: controller.certificates.length,
                      itemBuilder: (_, i) => CertificateCard(data: controller.certificates[i]),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
