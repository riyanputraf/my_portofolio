import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.eyebrow, required this.title});
  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyebrow,
            style: TextStyle(
              color: Colors.black87,
              fontSize: isMobile ? 14 : 16,
              letterSpacing: 0.3,
            )),
        const SizedBox(height: 6),
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: isMobile ? 28 : 36,
              height: 1.15,
            )),
      ],
    );
  }
}
