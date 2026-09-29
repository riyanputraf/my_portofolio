import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/features/home/controllers/home_controller.dart';
import 'package:my_portofolio/features/home/views/components/certification_section_component/certificate_card.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';
import 'package:my_portofolio/features/home/views/components/section_title.dart';

class CertificationsSection extends StatefulWidget {
  const CertificationsSection({super.key});
  @override
  State<CertificationsSection> createState() => _CertificationsSectionState();
}

class _CertificationsSectionState extends State<CertificationsSection> {
  bool _all = false;
  @override
  Widget build(BuildContext context) => SectionShell(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SectionTitle(
            eyebrow: 'Always growing', title: 'Curiosity, backed by practice.'),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, box) {
          final columns = box.maxWidth >= 950
              ? 3
              : box.maxWidth >= 600
                  ? 2
                  : 1;
          final width = (box.maxWidth - 20 * (columns - 1)) / columns;
          return Obx(() {
            final data = HomeController.to.certificates;
            // Measure all titles, including collapsed cards, so expanding the
            // collection cannot change the height of the featured cards.
            double titleHeight = 0;
            for (final certificate in data) {
              final painter = TextPainter(
                text: TextSpan(
                    text: certificate.title,
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(CertificateCard.titleStyle)),
                textDirection: Directionality.of(context),
                textScaler: MediaQuery.textScalerOf(context),
                locale: Localizations.maybeLocaleOf(context),
              )..layout(maxWidth: width - 40);
              if (painter.height > titleHeight) titleHeight = painter.height;
              painter.dispose();
            }
            return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: data
                    .take(_all ? data.length : 3)
                    .map((c) => SizedBox(
                        width: width,
                        child:
                            CertificateCard(data: c, titleHeight: titleHeight)))
                    .toList());
          });
        }),
        const SizedBox(height: 24),
        Center(
            child: OutlinedButton.icon(
                onPressed: () => setState(() => _all = !_all),
                icon: Icon(_all ? Icons.remove : Icons.add),
                label: Text(_all
                    ? 'Show featured certificates'
                    : 'View all 9 certificates'))),
      ]));
}
