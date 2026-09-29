class ProjectModel {
  const ProjectModel(
      {required this.name,
      required this.category,
      required this.image,
      required this.summary,
      required this.stack});
  final String name;
  final String category;
  final String image;
  final String summary;
  final List<String> stack;
}

// Project descriptions and artwork are sourced from the supplied portfolio PDF.
const portfolioProjects = [
  ProjectModel(
      name: 'Masjid Dana',
      category: 'Community',
      image: 'masjid-dana',
      summary:
          'A digital platform that helps mosques manage donations, income, and expenses with greater transparency. A simpler way for communities to support and follow the causes they care about.',
      stack: ['Flutter', 'Firebase']),
  ProjectModel(
      name: 'Mobile I-Lab',
      category: 'Productivity',
      image: 'milab',
      summary:
          'A companion for university practical activities. MiLab helps students, lecturers, and laboratory assistants access information and coordinate their day-to-day academic activities.',
      stack: ['Flutter', 'Firebase', 'Go']),
  ProjectModel(
      name: 'Monitoring Kandang',
      category: 'IoT',
      image: 'monitoring-kandang',
      summary:
          'A mobile dashboard for monitoring environmental conditions in livestock housing, including temperature and humidity. Connected sensor data makes conditions easier to follow.',
      stack: ['Flutter', 'Laravel', 'Firebase']),
  ProjectModel(
      name: 'LappyHub',
      category: 'Commerce',
      image: 'lappyhub',
      summary:
          'A laptop rental application that helps students and other users access the devices they need without buying a new laptop. Browse devices, review rental details, and manage orders.',
      stack: ['Flutter', 'Firebase']),
  ProjectModel(
      name: 'JavaCode',
      category: 'Commerce',
      image: 'javacode',
      summary:
          'A food and beverage ordering application with customizable toppings and spice levels. Designed to make choosing, personalizing, and ordering a meal more convenient.',
      stack: ['Flutter', 'Firebase']),
  ProjectModel(
      name: 'Shoeva App',
      category: 'Commerce',
      image: 'shoeva',
      summary:
          'A shoe shopping application built with Flutter, using Laravel to manage product data and Firebase for messaging. A connected experience from browsing products to checkout.',
      stack: ['Flutter', 'Laravel', 'Firebase', 'Dart']),
  ProjectModel(
      name: 'Family Plus',
      category: 'Productivity',
      image: 'family-plus',
      summary:
          'A multiplatform application that helps families organize household tasks and recognize each other’s contributions. Motivation and appreciation are part of the everyday workflow.',
      stack: ['Flutter', 'Firebase', 'Dart']),
];
