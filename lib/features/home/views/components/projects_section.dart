import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/controllers/projects_controller.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';
import 'package:my_portofolio/features/home/views/components/project_links.dart';

class ProjectsSection extends GetView<ProjectsController> {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionTitle(eyebrow: '02 / Selected work', title: 'Ideas turned into experiences.'),
      const SizedBox(height: 18),
      const Text('A collection of mobile products for everyday needs.',
          style: TextStyle(color: AppTheme.muted, fontSize: 16)),
      const SizedBox(height: 28),
      Obx(() {
        final selectedCategory = controller.selectedCategory.value;
        final projects = controller.filteredProjects;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(spacing: 10, runSpacing: 10, children: [
            _filterChip(
              label: 'All projects',
              category: null,
              selected: selectedCategory == null,
            ),
            ...ProjectCategory.values.map(
              (category) => _filterChip(
                label: category.label,
                category: category,
                selected: selectedCategory == category,
              ),
            ),
          ]),
          const SizedBox(height: 28),
          LayoutBuilder(builder: (context, box) {
            final columns = box.maxWidth >= 720 ? 2 : 1;
            final width = (box.maxWidth - (columns - 1) * 24) / columns;
            return SizedBox(
                width: box.maxWidth,
                child: Wrap(
                    spacing: 24,
                    runSpacing: 28,
                    children: projects
                        .map((project) =>
                            SizedBox(width: width, child: _ProjectCard(key: ValueKey(project.name), project: project)))
                        .toList()));
          }),
        ]);
      }),
    ]));
  }

  Widget _filterChip({
    required String label,
    required ProjectCategory? category,
    required bool selected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      selectedColor: AppTheme.blackBar,
      labelStyle: TextStyle(color: selected ? Colors.white : AppTheme.muted, fontWeight: FontWeight.w600, fontSize: 12),
      side: BorderSide(color: selected ? AppTheme.blackBar : AppTheme.line),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      onSelected: (_) => controller.selectCategory(category),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({super.key, required this.project});
  final ProjectModel project;
  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final reduced = MediaQuery.disableAnimationsOf(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: reduced ? Duration.zero : const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hover && !reduced ? -5 : 0, 0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: _hover ? .07 : .02), blurRadius: 24, offset: const Offset(0, 12))
        ]),
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22), side: const BorderSide(color: AppTheme.line)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
              onTap: () => _showProject(context, p),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AspectRatio(
                    aspectRatio: 1.6,
                    child: Image.asset(p.imageAsset,
                        fit: BoxFit.cover, cacheWidth: 810, semanticLabel: '${p.name} application screens')),
                Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(p.category.label.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 10, letterSpacing: 1.8, fontWeight: FontWeight.w700, color: AppTheme.primary)),
                      const SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: Text(p.name,
                                style: const TextStyle(fontSize: 25, letterSpacing: -.7, fontWeight: FontWeight.w700))),
                        const Icon(Icons.arrow_outward_rounded, size: 23)
                      ]),
                      const SizedBox(height: 12),
                      Text(p.summary,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: AppTheme.muted, height: 1.65)),
                      const SizedBox(height: 20),
                      Wrap(spacing: 8, runSpacing: 8, children: p.stack.map((s) => Tag(s)).toList()),
                      const SizedBox(height: 18),
                      const Text('Explore project',
                          style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 13)),
                      ProjectLinks(project: p),
                    ])),
              ])),
        ),
      ),
    );
  }
}

void _showProject(BuildContext context, ProjectModel p) => showDialog<void>(
    context: context,
    builder: (context) => Dialog(
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: SingleChildScrollView(
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 12, 12),
                    child: Row(children: [
                      Expanded(child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22))),
                      IconButton(
                          tooltip: 'Close project',
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close))
                    ])),
                Image.asset(p.imageAsset,
                    width: double.infinity, fit: BoxFit.contain, semanticLabel: '${p.name} application overview'),
                Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Tag(p.category.label),
                      const SizedBox(height: 16),
                      Text(p.summary, style: const TextStyle(fontSize: 16, height: 1.8)),
                      const SizedBox(height: 20),
                      Wrap(spacing: 8, runSpacing: 8, children: p.stack.map((s) => Tag(s)).toList()),
                      ProjectLinks(project: p),
                    ])),
              ]))),
        ));
