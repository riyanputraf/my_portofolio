import 'package:get/get.dart';
import 'package:my_portofolio/constants/profile_constans.dart';
import 'package:my_portofolio/features/home/models/education_model.dart';
import 'package:my_portofolio/features/home/models/experience_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final name = ProfileConst.name.obs;
  final role = ProfileConst.role.obs;
  final skills = ProfileConst.skills.obs;

  final education = <EducationModel>[
    EducationModel(
      period: 'Sep 2020 - Aug 2024',
      institution: 'University Of Muhammadiyah Malang',
      degree: 'Bachelor of Computer Science in Informatics Department',
      highlights: [
        'Obtained a GPA of 3.97.',
        'Graduated with the best honors at the study program and faculty level.',
        'Experienced as a laboratory assistant for 3 years.',
      ],
    ),
  ].obs;

  final experiences = <ExperienceModel>[
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Global Edge Teknologi',
      periodText: 'Feb 2025 - Now',
      start: DateTime(2025, 2, 1),
      end: null,
      durationOverride: '7 month',
      logoAsset: 'assets/images/logos/get.png',
      bullets: [
        'Developed POS application for user needs.',
        'Developed more than 5 feature application.',
        'Developed integrated hardware to application.',
      ],
    ),
    ExperienceModel(
      role: 'Mobile Programmer Intern',
      company: 'Venturo Pro Indonesia',
      periodText: 'Oct 2024 - Jan 2025',
      start: DateTime(2024, 10, 1),
      end: DateTime(2025, 1, 31),
      durationOverride: '4 month',
      logoAsset: 'assets/images/logos/venturo.png',
      bullets: [
        'Developed more than 2 project mobile application.',
        'Developed more than 10 additional features into a mobile application.',
        'Developed mobile application using 2 different flavor (Production and Staging).',
      ],
    ),
    ExperienceModel(
      role: 'Mobile Developer Freelance',
      company: 'Laboratorium Informatika Universitas Muhammadiyah Malang',
      periodText: 'Jul 2021 - Jul 2024',
      start: DateTime(2021, 7, 1),
      end: DateTime(2024, 7, 1),
      durationOverride: '3 year',
      logoAsset: 'assets/images/logos/umm.png',
      bullets: [
        'Developed and released 1 android application for 2 different roles (assistant and student).',
        'Developed 2 additional features into a mobile app using flutter.',
      ],
    ),
  ].obs;
}
