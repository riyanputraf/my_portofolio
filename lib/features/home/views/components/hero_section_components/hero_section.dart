import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/data/portfolio_data.dart';
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
            const Tag(PortfolioData.role),
            const SizedBox(height: 26),
            Text('Thoughtful apps.\nMeaningful\nexperiences.',
                style: TextStyle(
                    fontSize: mobile ? 46 : 66, height: 1.04, letterSpacing: -2.8, fontWeight: FontWeight.w700)),
            const SizedBox(height: 26),
            const Text("Hi, I’m ${PortfolioData.name}.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                          child: Image.asset('assets/images/foto1.jpg',
                              fit: BoxFit.cover,
                              alignment: const Alignment(0, -.6),
                              semanticLabel: 'Portrait of Riyan Putra Firjatullah')),
                    )),
                Positioned(
                    bottom: 28,
                    left: 0,
                    child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(color: AppTheme.blackBar, borderRadius: BorderRadius.circular(16)),
                        child: const Row(mainAxisSize: MainAxisSize.min, children: [
                          FlutterLogo(size: 30),
                          SizedBox(width: 14),
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('From idea to app',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                            Text('Mobile · API · User experience',
                                style: TextStyle(color: Color(0xFFCAC5DB), fontSize: 11))
                          ])
                        ]))),
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
