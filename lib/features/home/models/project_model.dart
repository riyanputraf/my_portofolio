enum ProjectCategory {
  commerce('Commerce'),
  productivity('Productivity'),
  community('Community'),
  iot('IoT');

  const ProjectCategory(this.label);
  final String label;
}

class ProjectModel {
  const ProjectModel(
      {required this.name,
      required this.category,
      required this.imageAsset,
      required this.summary,
      required this.stack});
  final String name;
  final ProjectCategory category;
  final String imageAsset;
  final String summary;
  final List<String> stack;
}
