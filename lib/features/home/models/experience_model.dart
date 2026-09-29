class ExperienceModel {
  final String role;
  final String company;
  final String period;
  final List<String> bullets;
  final String? logoAsset;
  final bool isCurrent;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.period,
    required this.bullets,
    this.logoAsset,
    this.isCurrent = false,
  });
}
