import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/data/portfolio_data.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SectionTitle(eyebrow: '04 / What I bring', title: 'The tools. The craft. The care.'),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, box) {
          final width = box.maxWidth >= 800 ? (box.maxWidth - 40) / 3 : box.maxWidth;
          const services = [
            (
              Icons.phone_android_rounded,
              'Mobile development',
              'Intuitive applications built with Flutter, from the first screen to the everyday details.'
            ),
            (
              Icons.hub_outlined,
              'Connected experiences',
              'APIs, backend services, and device integrations that bring the whole product together.'
            ),
            (
              Icons.tune_rounded,
              'Careful refinement',
              'Feature improvements, bug fixes, and testing that keep applications dependable.'
            ),
          ];
          return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: services
                  .map((s) => Container(
                      width: width,
                      padding: const EdgeInsets.all(26),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.line), borderRadius: BorderRadius.circular(18)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Icon(s.$1, color: AppTheme.primary, size: 30),
                        const SizedBox(height: 22),
                        Text(s.$2, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                        Text(s.$3, style: const TextStyle(color: AppTheme.muted, height: 1.8))
                      ])))
                  .toList());
        }),
        const SizedBox(height: 32),
        Wrap(
            spacing: 12,
            runSpacing: 12,
            children: PortfolioData.serviceSkills
                .map((s) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.line)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Image.asset(s.asset, width: 22, height: 22, fit: BoxFit.contain),
                      const SizedBox(width: 10),
                      Flexible(child: Text(s.title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                    ])))
                .toList()),
      ]));
}
