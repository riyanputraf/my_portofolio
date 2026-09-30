import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/models/experience_model.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.data});
  final ExperienceModel data;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppTheme.line),
            borderRadius: BorderRadius.circular(18)),
        child: LayoutBuilder(builder: (context, box) {
          final desktop = box.maxWidth >= 650;
          final meta =
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data.period,
                style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.muted,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            if (data.isCurrent) const Tag('Current role'),
            const SizedBox(height: 18),
            if (data.logoAsset != null)
              Image.asset(data.logoAsset!,
                  height: desktop ? 80 : 48,
                  width: desktop ? 160 : 96,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  semanticLabel: data.company),
          ]);
          final content =
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data.role,
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: -.4)),
            const SizedBox(height: 6),
            Text(data.company,
                style: const TextStyle(color: AppTheme.primary, fontSize: 14)),
            const SizedBox(height: 18),
            ...data.bullets.map((text) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(Icons.arrow_outward,
                              size: 14, color: AppTheme.primary)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Text(text.trim(),
                              style: const TextStyle(
                                  color: AppTheme.muted,
                                  fontSize: 14,
                                  height: 1.65)))
                    ]))),
          ]);
          return box.maxWidth < 650
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [meta, const SizedBox(height: 22), content])
              : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(width: 220, child: meta),
                  Expanded(child: content)
                ]);
        }),
      );
}
