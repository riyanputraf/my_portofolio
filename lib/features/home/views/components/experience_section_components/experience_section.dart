import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/data/portfolio_data.dart';
import 'package:my_portofolio/features/home/views/components/experience_section_components/experience_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
        color: AppTheme.sectionAlt,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionTitle(eyebrow: '03 / My journey', title: 'Experience, built over time.'),
          const SizedBox(height: 32),
          Column(
              children: PortfolioData.experiences
                  .map((data) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ExperienceCard(data: data),
                      ))
                  .toList()),
        ]),
      );
}
