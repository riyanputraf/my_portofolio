class ExperienceModel {
  final String role; // Flutter Developer
  final String company; // Global Edge Teknologi
  final String periodText; // e.g. "Feb 2025 - Now"
  final DateTime start; // 2025-02-01
  final DateTime? end; // null = Now
  final List<String> bullets; // highlights
  final String? logoAsset; // assets/images/logos/get.png
  final String? durationOverride; // optional: "7 month" (pakai ini jika ingin angka spesifik)

  ExperienceModel({
    required this.role,
    required this.company,
    required this.periodText,
    required this.start,
    this.end,
    required this.bullets,
    this.logoAsset,
    this.durationOverride,
  });
}
