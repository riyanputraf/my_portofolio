import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certification_section.dart';
import 'package:my_portofolio/features/home/views/components/education_section_components/education_section.dart';
import 'package:my_portofolio/features/home/views/components/experience_section_components/experience_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/hero_section.dart';
import 'package:my_portofolio/features/home/views/components/personal_intro_section_component/personal_intro_section.dart';
import 'package:my_portofolio/features/home/views/components/hero_section_components/skills_strip.dart';
import 'package:my_portofolio/features/home/views/components/service_section_component/service_section.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(), // header seperti contoh gambar
            const SizedBox(height: 24),
            SkillsStrip(), // bar hitam skills + star
            const SizedBox(height: 80),
            const PersonalIntroSection(),
            const SizedBox(height: 80),

            const EducationSection(),

            const SizedBox(
              height: 80,
            ),

            const ExperienceSection(),

            const SizedBox(height: 50),

            const CertificationsSection(),

            const SizedBox(height: 50),

            const ServicesSection(),
            // TODO: tambahkan About(), Projects(), Contact() versi statis
          ],
        ),
      ),
    );
  }
}
