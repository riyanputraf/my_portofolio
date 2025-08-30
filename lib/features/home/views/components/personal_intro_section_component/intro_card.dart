import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;
    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(blurRadius: 24, color: Color(0x14000000))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello...',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: isMobile ? 28 : 36,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: isMobile ? 14 : 15.5,
              height: 1.55,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
