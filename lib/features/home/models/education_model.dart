class EducationModel {
  final String period; // e.g. "Sep 2020 - Aug 2024"
  final String institution; // e.g. "University Of Muhammadiyah Malang"
  final String
      degree; // e.g. "Bachelor of Computer Science in Informatics Department"
  final List<String> highlights;

  EducationModel({
    required this.period,
    required this.institution,
    required this.degree,
    required this.highlights,
  });
}
