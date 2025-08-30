import 'package:flutter/material.dart';

class LaptopMockup extends StatelessWidget {
  const LaptopMockup({super.key, required this.child, this.width = 520});
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    final screenH = width * 0.62;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: screenH,
          decoration: BoxDecoration(
            color: const Color(0xFF0F1012),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(blurRadius: 24, offset: Offset(0, 14), color: Colors.black26),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(color: Colors.white, child: child),
          ),
        ),
        const SizedBox(height: 10),
        // base/keyboard shadow
        Container(
          width: width * 1.06,
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.black54, Colors.black87, Colors.black54],
            ),
            boxShadow: const [BoxShadow(blurRadius: 16, color: Colors.black26)],
          ),
        ),
      ],
    );
  }
}
