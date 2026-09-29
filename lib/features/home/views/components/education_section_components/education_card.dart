import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/models/education_model.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key, required this.data});
  final EducationModel data;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(data.period,
            style: TextStyle(
                fontSize: isMobile ? 14 : 15.5, color: Colors.black87)),
        Text(data.institution,
            style: TextStyle(
                fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.w800)),
        Text(
          data.degree,
          style: TextStyle(
              fontSize: isMobile ? 13 : 14.5, color: Colors.blueGrey[600]),
        ),
      ],
    );

    final right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: data.highlights.map((e) => _Bullet(text: e)).toList(),
    );

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.line),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                left,
                const Divider(height: 24),
                right,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: left),
                SizedBox(
                  height: 96,
                  child: VerticalDivider(
                      width: 28, thickness: 1.2, color: Colors.grey.shade300),
                ),
                Expanded(flex: 5, child: right),
              ],
            ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 6, color: AppTheme.primary),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(height: 1.55, fontSize: 14.5),
          ),
        ),
      ],
    );
  }
}
