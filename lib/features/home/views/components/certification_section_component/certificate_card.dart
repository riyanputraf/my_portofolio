import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/models/certificate_model.dart';
import 'package:my_portofolio/features/home/views/components/contact_section.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({super.key, required this.data, this.titleHeight});
  final double? titleHeight;
  static const titleStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 16, height: 1.4);
  final CertificateModel data;
  void _preview(BuildContext context) => showDialog<void>(
      context: context,
      builder: (context) => Dialog(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(data.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)))),
                IconButton(
                    tooltip: 'Close certificate',
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close))
              ]),
              Image.asset(data.imageAsset,
                  fit: BoxFit.contain, semanticLabel: data.title),
              if (data.linkUrl.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton.icon(
                        onPressed: () =>
                            openPortfolioLink(context, Uri.parse(data.linkUrl)),
                        icon: const Icon(Icons.verified_outlined),
                        label: const Text('Verify on Dicoding'))),
            ])),
          )));
  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: AppTheme.line)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            onTap: () => _preview(context),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AspectRatio(
                  aspectRatio: 1.65,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(data.imageAsset,
                          cacheWidth: 640,
                          fit: BoxFit.contain,
                          semanticLabel: data.title))),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: titleHeight,
                          child: Text(data.title, style: titleStyle),
                        ),
                        const SizedBox(height: 8),
                        Text(data.issuer,
                            style: const TextStyle(
                                color: AppTheme.muted, fontSize: 12)),
                        const SizedBox(height: 18),
                        const Text('View certificate',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary,
                                fontSize: 13)),
                      ])),
            ])),
      );
}
