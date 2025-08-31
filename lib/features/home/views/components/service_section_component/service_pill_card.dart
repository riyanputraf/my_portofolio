import 'package:flutter/material.dart';

class ServicePillCard extends StatefulWidget {
  const ServicePillCard({super.key, required this.title, required this.asset, this.width});
  final String title;
  final String asset;
  final double? width;

  @override
  State<ServicePillCard> createState() => _ServicePillCardState();
}

class _ServicePillCardState extends State<ServicePillCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        transform: _hover ? Matrix4.translationValues(0, -2, 0) : Matrix4.identity(),
        width: w,
        height: 84,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              blurRadius: _hover ? 18 : 12,
              offset: const Offset(0, 6),
              color: const Color(0x14000000),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(widget.asset, fit: BoxFit.contain, errorBuilder: (_, __, ___) {
                return const Icon(Icons.widgets_rounded, size: 24, color: Colors.black54);
              }),
            ),
            Flexible(
              child: Text(widget.title,
                  overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
