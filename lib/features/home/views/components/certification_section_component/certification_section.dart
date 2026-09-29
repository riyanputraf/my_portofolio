import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/certifications_controller.dart';
import 'package:my_portofolio/features/home/data/portfolio_data.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certificate_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class CertificationsSection extends GetView<CertificationsController> {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) => SectionShell(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SectionTitle(eyebrow: 'Always growing', title: 'Curiosity, backed by practice.'),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, box) {
          final columns = box.maxWidth >= 950
              ? 3
              : box.maxWidth >= 600
                  ? 2
                  : 1;
          final width = (box.maxWidth - 20 * (columns - 1)) / columns;
          final data = PortfolioData.certificates;
          // Measure all titles, including collapsed cards, so expanding the
          // collection cannot change the height of the featured cards.
          double titleHeight = 0;
          for (final certificate in data) {
            final painter = TextPainter(
              text: TextSpan(
                  text: certificate.title, style: DefaultTextStyle.of(context).style.merge(CertificateCard.titleStyle)),
              textDirection: Directionality.of(context),
              textScaler: MediaQuery.textScalerOf(context),
              locale: Localizations.maybeLocaleOf(context),
            )..layout(maxWidth: width - 40);
            if (painter.height > titleHeight) titleHeight = painter.height;
            painter.dispose();
          }
          return Obx(() => Wrap(
                spacing: 20,
                runSpacing: 20,
                children: data
                    .take(controller.showAll.value ? data.length : 3)
                    .map((certificate) => SizedBox(
                        width: width,
                        child: CertificateCard(
                          data: certificate,
                          titleHeight: titleHeight,
                        )))
                    .toList(),
              ));
        }),
        const SizedBox(height: 24),
        Center(
            child: Obx(() => OutlinedButton.icon(
                  onPressed: controller.toggle,
                  icon: Icon(controller.showAll.value ? Icons.remove : Icons.add),
                  label: Text(controller.showAll.value ? 'Show featured certificates' : 'View all 9 certificates'),
                ))),
      ]));
}
