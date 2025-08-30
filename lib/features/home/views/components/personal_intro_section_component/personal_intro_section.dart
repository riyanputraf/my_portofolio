import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/constants/profile_constans.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/personal_intro_section_component/intro_card.dart';
import 'package:my_portofolio/features/home/views/components/personal_intro_section_component/laptop_mockup.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class PersonalIntroSection extends GetView<HomeController> {
  const PersonalIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    const maxW = 1200.0;
    return Container(
      color: const Color(0xFFF6F7F9), // abu muda tipis seperti contoh
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxW),
          child: LayoutBuilder(builder: (_, c) {
            final isMobile = c.maxWidth < 980;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(eyebrow: 'Get To Know Me', title: 'Personal Introduction'),
                const SizedBox(height: 24),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(right: isMobile ? 0 : 24, bottom: isMobile ? 24 : 0),
                        child: LaptopMockup(
                          width: isMobile ? c.maxWidth : 540,
                          child: Center(
                            child: Image.asset(
                              'assets/images/foto1.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: IntroCard(
                        title: 'Hello...',
                        body: ProfileConst.introEn,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
