import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/hero_section.dart';
import 'package:my_portofolio/features/home/views/components/skills_strip.dart';

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
            // TODO: tambahkan About(), Projects(), Contact() versi statis
          ],
        ),
      ),
    );
  }
}
