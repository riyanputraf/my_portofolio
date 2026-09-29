import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class PersonalIntroSection extends StatelessWidget {
  const PersonalIntroSection({super.key});
  @override
  Widget build(BuildContext context) => SectionShell(
        color: const Color(0xFFF0EDF6),
        child: LayoutBuilder(builder: (context, box) {
          const heading = SectionTitle(
              eyebrow: '01 / A little about me',
              title: 'A developer with\na people-first mindset.');
          final body =
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Hello, I’m Riyan.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            const Text(
                'I build mobile applications that connect what people need with what businesses want to achieve. My focus is clean code, intuitive interactions, and reliable experiences.',
                style: TextStyle(
                    fontSize: 16, height: 1.8, color: AppTheme.muted)),
            const SizedBox(height: 14),
            const Text(
                'From campus tools to commerce and connected devices, I enjoy turning complex workflows into something simple to use. I keep learning, testing, and refining along the way.',
                style: TextStyle(
                    fontSize: 16, height: 1.8, color: AppTheme.muted)),
            const SizedBox(height: 24),
            const Wrap(spacing: 8, runSpacing: 8, children: [
              Tag('Clean architecture'),
              Tag('User-focused'),
              Tag('Continuous learning')
            ]),
          ]);
          return box.maxWidth < 740
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [heading, const SizedBox(height: 32), body])
              : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Expanded(child: heading),
                  const SizedBox(width: 72),
                  Expanded(child: body)
                ]);
        }),
      );
}
