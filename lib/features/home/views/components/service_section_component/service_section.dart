import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/service_section_component/service_pill_card.dart';

class ServicesSection extends GetView<HomeController> {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const maxW = 1200.0;

    return Container(
      color: const Color(0xFFF6F7F9),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxW),
          child: LayoutBuilder(builder: (_, c) {
            final w = c.maxWidth;
            // Lebar kartu per breakpoint
            final cardW = w >= 1100 ? 300.0 : (w >= 720 ? 280.0 : double.infinity);

            return Column(
              children: [
                Text('Great Services', style: TextStyle(color: Colors.black87, fontSize: w < 800 ? 14 : 16)),
                const SizedBox(height: 6),
                Text(
                  'My Skills, Effort, Time\nFor Your Business',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    fontSize: w < 800 ? 28 : 36,
                  ),
                ),
                const SizedBox(height: 28),
                Obx(() {
                  final items = controller.serviceSkills;
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: items.map((e) => ServicePillCard(title: e.title, asset: e.asset, width: cardW)).toList(),
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
