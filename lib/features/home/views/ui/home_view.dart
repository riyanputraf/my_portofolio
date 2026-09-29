import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certification_section.dart';
import 'package:my_portofolio/features/home/views/components/contact_section.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_section.dart';
import 'package:my_portofolio/features/home/views/components/experience_section_components/experience_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/hero_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/skills_strip.dart';
import 'package:my_portofolio/features/home/views/components/personal_intro_section_component/personal_intro_section.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/projects_section.dart';
import 'package:my_portofolio/features/home/views/components/service_section_component/service_section.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static const _labels = [
    'Home',
    'About',
    'Work',
    'Experience',
    'Credentials',
    'Contact',
  ];

  void _go(BuildContext context, int index) {
    controller.goToSection(
      index,
      disableAnimations: MediaQuery.disableAnimationsOf(context),
    );
  }

  Widget _section(int index, Widget child) => SizedBox(
        key: controller.sectionKeys[index],
        child: ScrollReveal(
          controller: controller.scrollController,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < AppTheme.navigationBreakpoint ||
        MediaQuery.textScalerOf(context).scale(14) > 18;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppTheme.background,
            border: Border(bottom: BorderSide(color: AppTheme.line)),
          ),
          child: SafeArea(
            bottom: false,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: compact ? 24 : 48),
                  child: Obx(() {
                    final active = controller.activeSection.value;
                    return Row(children: [
                      TextButton(
                        onPressed: () => _go(context, 0),
                        child: const Text(
                          'riyan.',
                          style: TextStyle(
                            color: AppTheme.ink,
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.5,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (!compact)
                        ...List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: TextButton(
                              onPressed: () => _go(context, index),
                              style: TextButton.styleFrom(
                                foregroundColor: active == index ? AppTheme.primary : AppTheme.muted,
                                backgroundColor: active == index ? AppTheme.tagBackground : Colors.transparent,
                              ),
                              child: Text(
                                _labels[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (!compact) const SizedBox(width: 20),
                      if (!compact)
                        FilledButton.icon(
                          onPressed: () => _go(context, 5),
                          icon: const Icon(Icons.arrow_outward, size: 16),
                          iconAlignment: IconAlignment.end,
                          label: const Text('Let’s talk'),
                        ),
                      if (compact)
                        PopupMenuButton<int>(
                          tooltip: 'Open navigation',
                          icon: const Icon(Icons.menu_rounded),
                          onSelected: (index) => _go(context, index),
                          itemBuilder: (_) => List.generate(
                            _labels.length,
                            (index) => PopupMenuItem(
                              value: index,
                              child: Text(_labels[index]),
                            ),
                          ),
                        ),
                    ]);
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Scrollbar(
        controller: controller.scrollController,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(children: [
            _section(
              0,
              HeroSection(
                onProjects: () => _go(context, 2),
                onContact: () => _go(context, 5),
              ),
            ),
            const SkillsStrip(),
            _section(1, const PersonalIntroSection()),
            _section(2, const ProjectsSection()),
            _section(3, const ExperienceSection()),
            ScrollReveal(
              controller: controller.scrollController,
              child: const ServicesSection(),
            ),
            _section(4, const EducationSection()),
            ScrollReveal(
              controller: controller.scrollController,
              child: const CertificationsSection(),
            ),
            _section(
              5,
              ContactSection(onBackToTop: () => _go(context, 0)),
            ),
          ]),
        ),
      ),
    );
  }
}
