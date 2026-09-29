import 'package:my_portofolio/features/home/models/certificate_model.dart';
import 'package:my_portofolio/features/home/models/education_model.dart';
import 'package:my_portofolio/features/home/models/experience_model.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';
import 'package:my_portofolio/features/home/models/service_skill_model.dart';

/// Single source of truth for portfolio content.
///
/// Keep presentation and interaction state inside widgets; edit portfolio
/// copy, links, and asset references here.
abstract final class PortfolioData {
  static const name = 'Riyan Putra Firjatullah';
  static const role = 'Flutter Developer';

  static const skills = ['FLUTTER', 'LARAVEL', 'PHP', 'ANDROID', 'GIT'];

  static const education = [
    EducationModel(
      period: 'Sep 2020 - Aug 2024',
      institution: 'University of Muhammadiyah Malang',
      degree: 'Bachelor of Computer Science, Informatics',
      highlights: [
        'Graduated with a GPA of 3.97.',
        'Graduated with the best honors at the study program and faculty level.',
        'Served as a laboratory assistant for 3 years.',
      ],
    ),
  ];

  static const experiences = [
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Global Edge Teknologi',
      period: 'Feb 2025 - Present',
      isCurrent: true,
      logoAsset: 'assets/images/get.png',
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
      logoAsset: 'assets/images/venturo.png',
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
      logoAsset: 'assets/images/lab_Informatika.png',
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
      logoAsset: 'assets/images/jatinom.png',
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

  static const certificates = [
    CertificateModel(
      title: 'Menjadi Flutter Developer Expert',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_expert.jpg',
      linkUrl: 'https://www.dicoding.com/certificates/JLX1L475NX72',
    ),
    CertificateModel(
      title: 'Belajar Fundamental Aplikasi Flutter',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_fundamental.jpg',
    ),
    CertificateModel(
      title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_pemula.jpg',
    ),
    CertificateModel(
      title: 'Belajar Membuat Aplikasi Back-End untuk Pemula',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_backend.jpg',
    ),
    CertificateModel(
      title: 'Belajar Dasar UX Design',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_ux_design.jpg',
    ),
    CertificateModel(
      title: 'Belajar Prinsip Pemrograman SOLID',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_solid_principles.jpg',
    ),
    CertificateModel(
      title: 'Belajar Dasar Pemrograman JavaScript',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_javascript.jpg',
    ),
    CertificateModel(
      title: 'Memulai Pemrograman dengan Dart',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_dart_basic.jpg',
    ),
    CertificateModel(
      title: 'Belajar Dasar Git dengan GitHub',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_github.jpg',
    ),
  ];

  static const serviceSkills = [
    ServiceSkillModel(title: 'Flutter', asset: 'assets/skills/flutter.png'),
    ServiceSkillModel(
      title: 'Mobile Development',
      asset: 'assets/skills/android.png',
    ),
    ServiceSkillModel(title: 'Laravel', asset: 'assets/skills/laravel.png'),
    ServiceSkillModel(title: 'PHP', asset: 'assets/skills/php.png'),
    ServiceSkillModel(title: 'API', asset: 'assets/skills/api.png'),
    ServiceSkillModel(title: 'MySQL', asset: 'assets/skills/mysql.png'),
    ServiceSkillModel(title: 'GIT', asset: 'assets/skills/git.png'),
  ];

  // Project copy and artwork are sourced from the supplied portfolio PDF.
  static const projects = [
    ProjectModel(
      name: 'Masjid Dana',
      category: ProjectCategory.community,
      imageAsset: 'assets/projects/masjid-dana.jpg',
      summary:
          'A digital platform that helps mosques manage donations, income, and expenses with greater transparency. A simpler way for communities to support and follow the causes they care about.',
      stack: ['Flutter', 'Firebase'],
    ),
    ProjectModel(
      name: 'Mobile I-Lab',
      category: ProjectCategory.productivity,
      imageAsset: 'assets/projects/milab.jpg',
      summary:
          'A companion for university practical activities. MiLab helps students, lecturers, and laboratory assistants access information and coordinate their day-to-day academic activities.',
      stack: ['Flutter', 'Firebase', 'Go'],
    ),
    ProjectModel(
      name: 'Monitoring Kandang',
      category: ProjectCategory.iot,
      imageAsset: 'assets/projects/monitoring-kandang.jpg',
      summary:
          'A mobile dashboard for monitoring environmental conditions in livestock housing, including temperature and humidity. Connected sensor data makes conditions easier to follow.',
      stack: ['Flutter', 'Laravel', 'Firebase'],
    ),
    ProjectModel(
      name: 'LappyHub',
      category: ProjectCategory.commerce,
      imageAsset: 'assets/projects/lappyhub.jpg',
      summary:
          'A laptop rental application that helps students and other users access the devices they need without buying a new laptop. Browse devices, review rental details, and manage orders.',
      stack: ['Flutter', 'Firebase'],
    ),
    ProjectModel(
      name: 'JavaCode',
      category: ProjectCategory.commerce,
      imageAsset: 'assets/projects/javacode.jpg',
      summary:
          'A food and beverage ordering application with customizable toppings and spice levels. Designed to make choosing, personalizing, and ordering a meal more convenient.',
      stack: ['Flutter', 'Firebase'],
    ),
    ProjectModel(
      name: 'Shoeva App',
      category: ProjectCategory.commerce,
      imageAsset: 'assets/projects/shoeva.jpg',
      summary:
          'A shoe shopping application built with Flutter, using Laravel to manage product data and Firebase for messaging. A connected experience from browsing products to checkout.',
      stack: ['Flutter', 'Laravel', 'Firebase', 'Dart'],
    ),
    ProjectModel(
      name: 'Family Plus',
      category: ProjectCategory.productivity,
      imageAsset: 'assets/projects/family-plus.jpg',
      summary:
          'A multiplatform application that helps families organize household tasks and recognize each other’s contributions. Motivation and appreciation are part of the everyday workflow.',
      stack: ['Flutter', 'Firebase', 'Dart'],
    ),
  ];
}
