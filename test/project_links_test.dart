import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/models/project_model.dart';
import 'package:my_portofolio/features/home/views/components/project_links.dart';

void main() {
  Future<void> showLinks(WidgetTester tester,
      {String? play, String? github}) async {
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
          body: SizedBox(
              width: 272,
              child: ProjectLinks(
                  project: ProjectModel(
                name: 'Example',
                category: ProjectCategory.commerce,
                imageAsset: 'assets/projects/shoeva-app.jpg',
                summary: 'Example project',
                stack: const ['Flutter'],
                googlePlayUrl: play,
                githubUrl: github,
              )))),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('Unavailable project destinations do not render buttons',
      (tester) async {
    await showLinks(tester);
    expect(find.byType(OutlinedButton), findsNothing);
    await showLinks(tester, play: ' ', github: 'not-a-url');
    expect(find.byType(OutlinedButton), findsNothing);
  });

  testWidgets('Project links render independently and wrap on narrow cards',
      (tester) async {
    const github = 'https://github.com/example/project';
    const play =
        'https://play.google.com/store/apps/details?id=com.example.app';
    await showLinks(tester, github: github);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('Google Play'), findsNothing);
    await showLinks(tester, play: play);
    expect(find.text('Google Play'), findsOneWidget);
    expect(find.text('GitHub'), findsNothing);
    await showLinks(tester, play: play, github: github);
    expect(find.byType(OutlinedButton), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });
}
