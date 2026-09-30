import 'package:flutter/material.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';
import 'package:my_portofolio/features/home/views/components/contact_section.dart';

/// Optional destinations shared by the project card and detail dialog.
class ProjectLinks extends StatelessWidget {
  const ProjectLinks({super.key, required this.project});

  final ProjectModel project;

  static Uri? _destination(String? value) {
    final uri = Uri.tryParse(value?.trim() ?? '');
    if (uri == null || uri.scheme != 'https' || uri.host.isEmpty) return null;
    return uri;
  }

  @override
  Widget build(BuildContext context) {
    final play = _destination(project.googlePlayUrl);
    final github = _destination(project.githubUrl);
    if (play == null && github == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Wrap(spacing: 10, runSpacing: 10, children: [
        if (play != null)
          OutlinedButton.icon(
            onPressed: () => openPortfolioLink(context, play),
            icon: const Icon(Icons.play_arrow_rounded, size: 18),
            label: const Text('Google Play'),
          ),
        if (github != null)
          OutlinedButton.icon(
            onPressed: () => openPortfolioLink(context, github),
            icon: const Icon(Icons.code_rounded, size: 18),
            label: const Text('GitHub'),
          ),
      ]),
    );
  }
}
