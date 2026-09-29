import 'package:get/get.dart';
import 'package:my_portofolio/features/home/data/portfolio_data.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';

class ProjectsController extends GetxController {
  final selectedCategory = Rxn<ProjectCategory>();

  List<ProjectModel> get filteredProjects => PortfolioData.projects
      .where((project) => selectedCategory.value == null || project.category == selectedCategory.value)
      .toList(growable: false);

  void selectCategory(ProjectCategory? category) {
    selectedCategory.value = category;
  }
}
