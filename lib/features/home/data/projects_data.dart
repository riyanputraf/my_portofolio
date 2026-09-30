import 'package:my_portofolio/features/home/models/project_model.dart';

/// Editable portfolio projects content.
abstract final class ProjectsData {
  static const projects = [
    ProjectModel(
        name: 'Masjid Dana',
        category: ProjectCategory.community,
        imageAsset: 'assets/projects/masjid-dana.jpg',
        summary:
            'A digital platform that helps mosques manage donations, income, and expenses with greater transparency. A simpler way for communities to support and follow the causes they care about.',
        stack: ['Flutter', 'Firebase'],
        googlePlayUrl:
            "https://play.google.com/store/apps/details?id=com.masjid.pro&hl=id"),
    ProjectModel(
        name: 'Mobile I-Lab',
        category: ProjectCategory.productivity,
        imageAsset: 'assets/projects/mobile-i-lab.jpg',
        summary:
            'A companion for university practical activities. MiLab helps students, lecturers, and laboratory assistants access information and coordinate their day-to-day academic activities.',
        stack: ['Flutter', 'Firebase', 'Go'],
        googlePlayUrl:
            "https://play.google.com/store/apps/details?id=com.infotech.milab&hl=id"),
    ProjectModel(
        name: 'LappyHub',
        category: ProjectCategory.commerce,
        imageAsset: 'assets/projects/lappyhub.jpg',
        summary:
            'A laptop rental application that helps students and other users access the devices they need without buying a new laptop. Browse devices, review rental details, and manage orders.',
        stack: ['Flutter', 'Firebase'],
        githubUrl: "https://github.com/riyanputraf/lappyhub"),
    ProjectModel(
        name: 'Shoeva App',
        category: ProjectCategory.commerce,
        imageAsset: 'assets/projects/shoeva-app.jpg',
        summary:
            'A shoe shopping application built with Flutter, using Laravel to manage product data and Firebase for messaging. A connected experience from browsing products to checkout.',
        stack: ['Flutter', 'Laravel', 'Firebase', 'Dart'],
        githubUrl: "https://github.com/riyanputraf/shoeva_app"),
    ProjectModel(
        name: 'Family Plus',
        category: ProjectCategory.productivity,
        imageAsset: 'assets/projects/family-plus.jpg',
        summary:
            'A multiplatform application that helps families organize household tasks and recognize each other’s contributions. Motivation and appreciation are part of the everyday workflow.',
        stack: ['Flutter', 'Firebase', 'Dart'],
        githubUrl: "https://github.com/Family-Plus/Family-Plus-Frontend"),
  ];
}
