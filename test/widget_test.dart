import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/bindings/home_binding.dart';
import 'package:my_portofolio/features/home/views/ui/home_view.dart';
import 'package:my_portofolio/features/home/views/components/projects_section.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certificate_card.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certification_section.dart';

void main() {
  tearDown(Get.reset);

  Future<void> mount(WidgetTester tester, Widget child, Size size,
      {double scale = 1}) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    HomeBinding().dependencies();
    await tester.pumpWidget(MaterialApp(
        theme: AppTheme.light,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
                disableAnimations: true, textScaler: TextScaler.linear(scale)),
            child: child!),
        home: child));
    await tester.pumpAndSettle();
  }

  for (final width in [320.0, 390.0, 768.0, 1440.0]) {
    testWidgets('Portfolio renders and navigates at $width px', (tester) async {
      await mount(tester, const HomePage(), Size(width, 900));
      expect(find.text('Explore my work'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.ensureVisible(find.text('Explore my work'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Explore my work'));
      await tester.pumpAndSettle();
      expect(find.text('Ideas turned into experiences.').hitTestable(),
          findsOneWidget);
      expect(tester.takeException(), isNull);
      if (width < 1000) {
        await tester.tap(find.byTooltip('Open navigation'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Contact'));
      } else {
        await tester.tap(find.text('Let’s talk').hitTestable());
      }
      await tester.pumpAndSettle();
      expect(find.text('Copy email').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.ensureVisible(find.text('Back to top'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Back to top'));
      await tester.pumpAndSettle();
      expect(
          tester
              .widget<Scrollable>(find.byType(Scrollable).first)
              .controller!
              .offset,
          0);
    });
  }

  testWidgets('Project filters and detail dialog work', (tester) async {
    await mount(
        tester,
        const Scaffold(body: SingleChildScrollView(child: ProjectsSection())),
        const Size(1440, 1000));
    await tester.tap(find.widgetWithText(ChoiceChip, 'IoT'));
    await tester.pumpAndSettle();
    expect(find.text('Masjid Dana'), findsNothing);
    expect(find.text('Monitoring Kandang'), findsOneWidget);
    await tester.tap(find.text('Monitoring Kandang'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.tap(find.byTooltip('Close project'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsNothing);
  });

  testWidgets('All certificates and local preview are accessible',
      (tester) async {
    await mount(
        tester,
        const Scaffold(
            body: SingleChildScrollView(child: CertificationsSection())),
        const Size(1440, 1100));
    await tester.tap(find.text('View all 9 certificates'));
    await tester.pumpAndSettle();
    expect(find.text('View certificate'), findsNWidgets(9));
    await tester.tap(find.text('View certificate').first);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Verify on Dicoding'), findsOneWidget);
    await tester.tap(find.byTooltip('Close certificate'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Large text has no layout overflow on mobile', (tester) async {
    await mount(tester, const HomePage(), const Size(390, 900), scale: 1.5);
    expect(tester.takeException(), isNull);
  });
  testWidgets('Scroll reveals animate into view and settle', (tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    HomeBinding().dependencies();
    await tester
        .pumpWidget(MaterialApp(theme: AppTheme.light, home: const HomePage()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explore my work'));
    await tester.pumpAndSettle();
    final opacity = tester.widget<FadeTransition>(find
        .ancestor(
            of: find.byType(ProjectsSection),
            matching: find.byType(FadeTransition))
        .first);
    expect(opacity.opacity.value, 1);
    expect(find.text('Ideas turned into experiences.').hitTestable(),
        findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  for (final width in [390.0, 1440.0]) {
    testWidgets('Project header stays fixed across filters at $width',
        (tester) async {
      await mount(
          tester,
          const Scaffold(
              body: SingleChildScrollView(
                  child: Column(children: [
            ProjectsSection(),
            SizedBox(height: 2000),
          ]))),
          Size(width, 1000));
      final header = find.text('Ideas turned into experiences.');
      final subtitle =
          find.text('A collection of mobile products for everyday needs.');
      final chip = find.widgetWithText(ChoiceChip, 'IoT');
      final headerRect = tester.getRect(header);
      final subtitleRect = tester.getRect(subtitle);
      final chipRect = tester.getRect(chip);
      final imageWidth = tester.getSize(find.byType(Image).first).width;
      for (final category in ['IoT', 'Community', 'Commerce', 'All projects']) {
        await tester.tap(find.widgetWithText(ChoiceChip, category));
        await tester.pumpAndSettle();
        expect(tester.getRect(header), headerRect);
        expect(tester.getRect(subtitle), subtitleRect);
        expect(tester.getRect(chip), chipRect);
        expect(tester.getSize(find.byType(Image).first).width, imageWidth);
        expect(tester.takeException(), isNull);
      }
    });
  }

  testWidgets('Section waits for reading area and reveals only once',
      (tester) async {
    final scroll = ScrollController();
    addTearDown(scroll.dispose);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      controller: scroll,
      child: Column(children: [
        const SizedBox(height: 1000),
        ScrollReveal(
            controller: scroll,
            child: const SizedBox(height: 200, child: Text('Reveal target'))),
        const SizedBox(height: 1000),
      ]),
    ))));
    await tester.pumpAndSettle();
    double opacity() => tester
        .widget<FadeTransition>(find
            .ancestor(
                of: find.text('Reveal target'),
                matching: find.byType(FadeTransition))
            .first)
        .opacity
        .value;
    expect(opacity(), 0);
    scroll.jumpTo(480); // Only the section edge has entered the viewport.
    await tester.pumpAndSettle();
    expect(opacity(), 0);
    scroll.jumpTo(700);
    await tester.pump(); // Visibility check runs after layout.
    await tester.pump(); // Start the animation ticker.
    await tester.pump(const Duration(milliseconds: 160));
    expect(opacity(), greaterThan(0));
    expect(opacity(), lessThan(1));
    await tester.pumpAndSettle();
    expect(opacity(), 1);
    for (final offset in [0.0, 700.0, 1400.0, 700.0]) {
      scroll.jumpTo(offset);
      await tester.pump();
      expect(opacity(), 1);
      await tester.pumpAndSettle();
      expect(opacity(), 1);
    }
  });
  for (final width in [390.0, 1440.0]) {
    testWidgets(
        'Certificate heights match before and after expansion at $width',
        (tester) async {
      await mount(
          tester,
          const Scaffold(
              body: SingleChildScrollView(child: CertificationsSection())),
          Size(width, 1100),
          scale: 1.5);
      final cards = find.byType(CertificateCard);
      final expectedHeight = tester.getSize(cards.first).height;
      for (final card in cards.evaluate()) {
        expect(
            tester.getSize(find.byWidget(card.widget)).height, expectedHeight);
      }
      await tester.ensureVisible(find.text('View all 9 certificates'));
      await tester.tap(find.text('View all 9 certificates'));
      await tester.pumpAndSettle();
      expect(cards, findsNWidgets(9));
      for (final card in cards.evaluate()) {
        expect(
            tester.getSize(find.byWidget(card.widget)).height, expectedHeight);
      }
      expect(tester.takeException(), isNull);
    });
  }
}
