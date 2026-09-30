import 'package:my_portofolio/features/home/models/education_model.dart';

/// Editable portfolio education content.
abstract final class EducationData {
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
}
