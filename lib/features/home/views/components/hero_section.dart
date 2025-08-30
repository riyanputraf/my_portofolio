import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';

class HeroSection extends GetView<HomeController> {
  const HeroSection({super.key});

  final _maxWidth = 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: _maxWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 32, vertical: isMobile ? 24 : 48),
              child: SizedBox(
                height: isMobile ? 480 : 520,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LEFT — text
                    Expanded(
                      flex: 6,
                      child: Obx(() {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: isMobile ? 12 : 16,
                          children: [
                            Text('Welcome To',
                                style: TextStyle(
                                    fontSize: isMobile ? 18 : 20,
                                    color: Colors.grey[700])),
                            Text(
                              'My Portofolio',
                              style: TextStyle(
                                fontSize: isMobile ? 40 : 56,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                              ),
                            ),
                            Text(
                              controller.role.value,
                              style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Created By:',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      color: Colors.grey[800]),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primary
                                        .withValues(alpha: 0.25),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Obx(() => Text(
                                        controller.name.value,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),

                    const SizedBox(width: 20),

                    // RIGHT — foto dalam kapsul biru
                    Expanded(
                      flex: 5,
                      child: _PhotoCapsule(isMobile: isMobile),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PhotoCapsule extends StatelessWidget {
  const _PhotoCapsule({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final double h = box.maxHeight;
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: h * (isMobile ? 0.95 : 1.0),
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: isMobile ? 8 : 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/foto1.jpg',
                    height: h * 0.95,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
