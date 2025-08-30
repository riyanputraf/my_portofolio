import 'package:flutter/material.dart';
import 'package:my_portofolio/features/home/models/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.data});
  final ExperienceModel data;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < 900;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [BoxShadow(blurRadius: 24, color: Color(0x14000000))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (logo + title + company + dates)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Logo(logoAsset: data.logoAsset),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(data.role,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: isMobile ? 16.5 : 18,
                        )),
                    Text(data.company,
                        style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontSize: isMobile ? 13.5 : 14.5,
                        )),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Right meta (period & duration)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 6,
                children: [
                  Text(data.periodText,
                      style: TextStyle(
                        fontSize: isMobile ? 13.5 : 14.5,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(
                    data.durationOverride ?? _durationLabel(data.start, data.end),
                    style: TextStyle(fontSize: isMobile ? 12.5 : 13, color: Colors.blueGrey[600]),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Bullets
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: data.bullets.map((b) => _Bullet(text: b)).toList(),
          ),
        ],
      ),
    );
  }

  String _durationLabel(DateTime start, DateTime? end) {
    final e = end ?? DateTime.now();
    int months = (e.year - start.year) * 12 + (e.month - start.month);
    if (months < 0) months = 0;
    final years = months ~/ 12;
    final rem = months % 12;
    if (years > 0 && rem > 0) return '$years year $rem month';
    if (years > 0) return years == 1 ? '1 year' : '$years years';
    return rem <= 1 ? '1 month' : '$rem months';
  }
}

class _Logo extends StatelessWidget {
  const _Logo({this.logoAsset});
  final String? logoAsset;
  @override
  Widget build(BuildContext context) {
    const double size = 44;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF3F4F6)),
      clipBehavior: Clip.antiAlias,
      child: (logoAsset != null)
          ? Image.asset(logoAsset!, fit: BoxFit.cover)
          : const Icon(Icons.business_center_rounded, size: 24, color: Colors.black54),
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
          padding: EdgeInsets.only(top: 8),
          child: Icon(Icons.circle, size: 6, color: Color(0xFF6C63FF)),
        ),
        Expanded(
          child: Text(text, style: const TextStyle(height: 1.55, fontSize: 14.5)),
        ),
      ],
    );
  }
}
