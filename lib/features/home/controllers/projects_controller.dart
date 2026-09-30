import 'package:get/get.dart';
import 'package:my_portofolio/features/home/data/projects_data.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';

class ProjectsController extends GetxController {
  final selectedCategory = Rxn<ProjectCategory>();

  final categories = ProjectCategory.values
      .where((category) =>
          ProjectsData.projects.any((project) => project.category == category))
      .toList(growable: false);

  List<ProjectModel> get filteredProjects => ProjectsData.projects
      .where((project) =>
          selectedCategory.value == null ||
          project.category == selectedCategory.value)
      .toList(growable: false);

  void selectCategory(ProjectCategory? category) {
    selectedCategory.value = category;
  }
}
