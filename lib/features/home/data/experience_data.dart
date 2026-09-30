import 'package:my_portofolio/features/home/models/experience_model.dart';

/// Editable portfolio experience content.
abstract final class ExperienceData {
  static const experiences = [
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Global Edge Teknologi',
      period: 'Feb 2025 - Present',
      isCurrent: true,
      logoAsset: 'assets/images/global-edge-teknologi.png',
      bullets: [
        'Developed a point-of-sale application tailored to user needs.',
        'Built more than 5 application features.',
        'Integrated hardware with the application.',
      ],
    ),
    ExperienceModel(
      role: 'Mobile Programmer Intern',
      company: 'Venturo Pro Indonesia',
      period: 'Oct 2024 - Jan 2025',
      logoAsset: 'assets/images/venturo-pro-indonesia.png',
      bullets: [
        'Contributed to more than 2 mobile application projects.',
        'Added more than 10 features to a mobile application.',
        'Configured production and staging flavors for mobile applications.',
      ],
    ),
    ExperienceModel(
      role: 'Mobile Developer Freelance',
      company: 'Laboratorium Informatika Universitas Muhammadiyah Malang',
      period: 'Jul 2021 - Jul 2024',
      logoAsset: 'assets/images/lab-informatika-umm.png',
      bullets: [
        'Developed and released an Android application for assistants and students.',
        'Added 2 features to a Flutter mobile application.',
        'Fixed 2 bugs in the attendance and student search features.',
      ],
    ),
    ExperienceModel(
      role: 'Mobile Developer Intern',
      company: 'PT. Jatinom Indah Agri',
      period: 'Nov 2022 - Jan 2023',
      logoAsset: 'assets/images/jatinom-indah-agri.png',
      bullets: [
        'Built mobile applications using Flutter, GetX, and Laravel.',
        'Integrated a mobile application with an Internet of Things server.',
        'Created application views for more than 3 data points.',
      ],
    ),
    ExperienceModel(
      role: 'Multi-Platform and Back-End Developer Cohort',
      company: 'Dicoding Indonesia',
      period: 'Aug 2022 - Jan 2023',
      logoAsset: 'assets/images/dicoding.png',
      bullets: [
        'Created more than 3 mini projects using Flutter.',
        'Completed more than 7 courses, including Flutter from beginner to expert level.',
        'Developed a mobile application for the final capstone project.',
      ],
    ),
  ];
}
