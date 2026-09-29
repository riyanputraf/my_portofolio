import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.eyebrow, required this.title});
  final String eyebrow;
  final String title;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(eyebrow.toUpperCase(),
              style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 11,
                  letterSpacing: 2.2,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          Text(title,
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width < 700 ? 32 : 42,
                  letterSpacing: -1.5,
                  height: 1.15,
                  fontWeight: FontWeight.w700)),
        ],
      );
}
