import 'package:flutter/material.dart';
import 'package:my_portofolio/features/home/models/certificate_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateCard extends StatefulWidget {
  const CertificateCard({super.key, required this.data});
  final CertificateModel data;

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.5,
      height: 1.25, // line-height
    );

    // tinggi untuk 2 baris title
    final titleLineH = (titleStyle.fontSize ?? 16.5) * (titleStyle.height ?? 1.2);
    final titleBoxH = titleLineH * 2; // 2 lines

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        transform: _hover ? Matrix4.translationValues(0, -3, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [BoxShadow(blurRadius: 22, color: Color(0x14000000))],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 20 / 10,
              child: Image.asset(widget.data.imageAsset, fit: BoxFit.cover),
            ),

            // Expanded supaya bisa pakai Spacer() untuk dorong link ke bawah (opsional)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ⬇️ Kotak fixed height untuk title (maks 2 baris)
                    SizedBox(
                      height: titleBoxH,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.data.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle,
                        ),
                      ),
                    ),

                    // ⬇️ Issuer sekarang pasti sejajar antar kartu
                    Text(
                      widget.data.issuer,
                      style: TextStyle(color: Colors.blueGrey[600], fontSize: 13.5),
                    ),

                    const SizedBox(height: 6),

                    // Opsional: biar link rata bawah semua kartu
                    const Spacer(),

                    InkWell(
                      onTap: () => _open(widget.data.linkUrl),
                      child: const Text(
                        'Certificate Link →',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.2,
                          color: Color(0xFF6C63FF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }
}
