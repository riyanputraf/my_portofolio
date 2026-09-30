import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/data/education_data.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
        color: AppTheme.sectionAlt,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionTitle(eyebrow: '05 / The foundation', title: 'Learning that lasts.'),
          const SizedBox(height: 32),
          Column(
              children: EducationData.education
                  .map((data) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: EducationCard(data: data),
                      ))
                  .toList()),
        ]),
      );
}
