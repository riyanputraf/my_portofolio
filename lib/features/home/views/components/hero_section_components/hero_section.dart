import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/data/profile_data.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onProjects, required this.onContact});
  final VoidCallback onProjects;
  final VoidCallback onContact;
  @override
  Widget build(BuildContext context) => SectionShell(
        child: LayoutBuilder(builder: (context, box) {
          final mobile = box.maxWidth < 740;
          final copy = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Tag(ProfileData.role),
            const SizedBox(height: 26),
            Text('Thoughtful apps.\nMeaningful\nexperiences.',
                style: TextStyle(
                    fontSize: mobile ? 46 : 66, height: 1.04, letterSpacing: -2.8, fontWeight: FontWeight.w700)),
            const SizedBox(height: 26),
            const Text("Hi, I’m ${ProfileData.name}.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: const Text(
                    'I turn everyday challenges into intuitive mobile applications, with Flutter and a little attention to detail.',
                    style: TextStyle(fontSize: 16, height: 1.7, color: AppTheme.muted))),
            const SizedBox(height: 28),
            Wrap(spacing: 12, runSpacing: 12, children: [
              FilledButton.icon(
                  onPressed: onProjects,
                  label: const Text('Explore my work'),
                  icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                  iconAlignment: IconAlignment.end),
              OutlinedButton(onPressed: onContact, child: const Text('Let’s talk')),
            ]),
            const SizedBox(height: 34),
          ]);
          final portrait = SizedBox(
              height: mobile ? 410 : 520,
              child: Stack(children: [
                Positioned.fill(
                    left: 24,
                    right: 12,
                    top: 20,
                    bottom: 20,
                    child: Container(
                      decoration:
                          BoxDecoration(color: const Color(0xFFE9E3F4), borderRadius: BorderRadius.circular(180)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(180),
                          child: Image.asset('assets/images/riyan-portrait.jpg',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              semanticLabel: 'Portrait of Riyan Putra Firjatullah')),
                    )),
                Positioned(
                    bottom: 28,
                    left: 0,
                    right: 24,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.blackBar,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF49405D)),
                          boxShadow: const [BoxShadow(color: Color(0x26000000), blurRadius: 24, offset: Offset(0, 8))],
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDDD2FF),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: const Icon(Icons.code_rounded, color: AppTheme.blackBar, size: 22),
                          ),
                          const SizedBox(width: 10),
                          const Flexible(child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('From idea to app',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                            SizedBox(height: 2),
                            Text('Built with care.',
                                style: TextStyle(color: Color(0xFFCAC5DB), fontSize: 11, height: 1.5))
                          ]))
                        ])))),
              ]));
          return mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [copy, const SizedBox(height: 36), portrait])
              : Row(children: [
                  Expanded(flex: 6, child: copy),
                  const SizedBox(width: 48),
                  Expanded(flex: 5, child: portrait)
                ]);
        }),
      );
}
