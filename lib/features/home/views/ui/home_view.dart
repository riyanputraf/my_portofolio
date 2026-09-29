import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certification_section.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_section.dart';
import 'package:my_portofolio/features/home/views/components/experience_section_components/experience_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/hero_section.dart';
import 'package:my_portofolio/features/home/views/components/personal_intro_section_component/personal_intro_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/skills_strip.dart';
import 'package:my_portofolio/features/home/views/components/service_section_component/service_section.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/projects_section.dart';
import 'package:my_portofolio/features/home/views/components/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _keys = List.generate(6, (_) => GlobalKey());
  final _active = ValueNotifier<int>(0);
  bool _trackingScheduled = false;
  final _labels = [
    'Home',
    'About',
    'Work',
    'Experience',
    'Credentials',
    'Contact'
  ];
  @override
  void initState() {
    super.initState();
    _scroll.addListener(_trackSection);
  }

  void _trackSection() {
    if (_trackingScheduled) return;
    _trackingScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackingScheduled = false;
      if (mounted) _updateActiveSection();
    });
  }

  void _updateActiveSection() {
    int active = 0;
    for (var i = 0; i < _keys.length; i++) {
      final box = _keys[i].currentContext?.findRenderObject();
      if (box is RenderBox && box.localToGlobal(Offset.zero).dy < 200) {
        active = i;
      }
    }
    if (_scroll.hasClients && _scroll.position.extentAfter < 40) active = 5;
    _active.value = active;
  }

  void _go(int index) {
    final target = _keys[index].currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(target,
        duration: MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    _scroll.removeListener(_trackSection);
    _scroll.dispose();
    _active.dispose();
    super.dispose();
  }

  Widget _section(int index, Widget child) => SizedBox(
      key: _keys[index],
      child: ScrollReveal(controller: _scroll, child: child));
  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 1000 ||
        MediaQuery.textScalerOf(context).scale(14) > 18;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: const BoxDecoration(
                color: AppTheme.background,
                border: Border(bottom: BorderSide(color: AppTheme.line))),
            child: SafeArea(
                bottom: false,
                child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: compact ? 24 : 48),
                          child: ValueListenableBuilder<int>(
                              valueListenable: _active,
                              builder: (context, active, _) => Row(children: [
                                    TextButton(
                                        onPressed: () => _go(0),
                                        child: const Text('riyan.',
                                            style: TextStyle(
                                                color: AppTheme.ink,
                                                fontSize: 27,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: -1.5))),
                                    const Spacer(),
                                    if (!compact)
                                      ...List.generate(
                                          5,
                                          (i) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: TextButton(
                                                onPressed: () => _go(i),
                                                style: TextButton.styleFrom(
                                                    foregroundColor: active == i
                                                        ? AppTheme.primary
                                                        : AppTheme.muted,
                                                    backgroundColor: active == i
                                                        ? const Color(
                                                            0xFFEFEBF7)
                                                        : Colors.transparent),
                                                child: Text(_labels[i],
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ))),
                                    if (!compact) const SizedBox(width: 20),
                                    if (!compact)
                                      FilledButton.icon(
                                          onPressed: () => _go(5),
                                          icon: const Icon(Icons.arrow_outward,
                                              size: 16),
                                          iconAlignment: IconAlignment.end,
                                          label: const Text('Let’s talk')),
                                    if (compact)
                                      PopupMenuButton<int>(
                                          tooltip: 'Open navigation',
                                          icon: const Icon(Icons.menu_rounded),
                                          onSelected: _go,
                                          itemBuilder: (_) => List.generate(
                                              _labels.length,
                                              (i) => PopupMenuItem(
                                                  value: i,
                                                  child: Text(_labels[i])))),
                                  ])),
                        )))),
          )),
      body: Scrollbar(
          controller: _scroll,
          child: SingleChildScrollView(
              controller: _scroll,
              child: Column(children: [
                _section(
                    0,
                    HeroSection(
                        onProjects: () => _go(2), onContact: () => _go(5))),
                const SkillsStrip(),
                _section(1, const PersonalIntroSection()),
                _section(2, const ProjectsSection()),
                _section(3, const ExperienceSection()),
                ScrollReveal(
                    controller: _scroll, child: const ServicesSection()),
                _section(4, const EducationSection()),
                ScrollReveal(
                    controller: _scroll, child: const CertificationsSection()),
                _section(5, ContactSection(onBackToTop: () => _go(0))),
              ]))),
    );
  }
}
