import 'package:get/get.dart';
import 'package:my_portofolio/constants/profile_constans.dart';
import 'package:my_portofolio/features/home/models/certificate_model.dart';
import 'package:my_portofolio/features/home/models/education_model.dart';
import 'package:my_portofolio/features/home/models/experience_model.dart';
import 'package:my_portofolio/features/home/models/sevice_skil_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final name = ProfileConst.name.obs;
  final role = ProfileConst.role.obs;
  final skills = ProfileConst.skills.obs;

  final education = <EducationModel>[
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
  ].obs;

  final experiences = <ExperienceModel>[
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Global Edge Teknologi',
      periodText: 'Feb 2025 - Now',
      start: DateTime(2025, 2, 1),
      end: null,
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
      periodText: 'Oct 2024 - Jan 2025',
      start: DateTime(2024, 10, 1),
      end: DateTime(2025, 1, 31),
      durationOverride: '4 month',
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
      periodText: 'Jul 2021 - Jul 2024',
      start: DateTime(2021, 7, 1),
      end: DateTime(2024, 7, 1),
      durationOverride: '3 year',
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
      periodText: 'Nov 2022 - Jan 2023',
      start: DateTime(2022, 11, 1),
      end: DateTime(2023, 1, 1),
      durationOverride: '3 month',
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
      periodText: 'Aug 2022 - Jan 2023 ',
      start: DateTime(2022, 8, 1),
      end: DateTime(2023, 1, 1),
      durationOverride: '6 month',
      logoAsset: 'assets/images/dicoding.png',
      bullets: [
        'Created more than 3 mini projects using Flutter.',
        'Completed more than 7 courses, including Flutter from beginner to expert level.',
        'Developed a mobile application for the final capstone project.',
      ],
    ),
  ].obs;

  final certificates = <CertificateModel>[
    const CertificateModel(
      title: 'Menjadi Flutter Developer Expert',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_expert.jpg',
      linkUrl: 'https://www.dicoding.com/certificates/JLX1L475NX72',
    ),
    const CertificateModel(
      title: 'Belajar Fundamental Aplikasi Flutter',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_fundamental.jpg',
      linkUrl: '',
    ),
    const CertificateModel(
      title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_flutter_pemula.jpg',
      linkUrl: '',
    ),
    const CertificateModel(
      title: 'Belajar Membuat Aplikasi Back-End untuk Pemula',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_backend.jpg',
      linkUrl: '',
    ),
    const CertificateModel(
      title: 'Belajar Dasar UX Design',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_ux_design.jpg',
      linkUrl: '',
    ),
    const CertificateModel(
      title: 'Belajar Prinsip Pemrograman SOLID',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding_solid_principles.jpg',
      linkUrl: '',
    ),
    const CertificateModel(
        title: 'Belajar Dasar Pemrograman JavaScript',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding_javascript.jpg',
        linkUrl: ''),
    const CertificateModel(
        title: 'Memulai Pemrograman dengan Dart',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding_dart_basic.jpg',
        linkUrl: ''),
    const CertificateModel(
        title: 'Belajar Dasar Git dengan GitHub',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding_github.jpg',
        linkUrl: ''),
  ].obs;

  final serviceSkills = <ServiceSkillModel>[
    const ServiceSkillModel(
        title: 'Flutter', asset: 'assets/skills/flutter.png'),
    const ServiceSkillModel(
        title: 'Mobile Development', asset: 'assets/skills/android.png'),
    const ServiceSkillModel(
        title: 'Laravel', asset: 'assets/skills/laravel.png'),
    const ServiceSkillModel(title: 'PHP', asset: 'assets/skills/php.png'),
    const ServiceSkillModel(title: 'API', asset: 'assets/skills/api.png'),
    const ServiceSkillModel(title: 'MySQL', asset: 'assets/skills/mysql.png'),
    const ServiceSkillModel(title: 'GIT', asset: 'assets/skills/git.png'),
  ].obs;
}
