import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';
import 'package:my_portofolio/features/home/views/components/portfolio_primitives.dart';

const portfolioEmail = 'riyanputrafirjatullah@gmail.com';

Future<void> openPortfolioLink(BuildContext context, Uri uri) async {
  try {
    if (await launchUrl(uri, webOnlyWindowName: '_blank')) return;
  } catch (_) {/* Show a recoverable message when no handler is available. */}
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the link. Please try again or copy the email address.')));
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.onBackToTop});
  final VoidCallback onBackToTop;
  @override
  Widget build(BuildContext context) => SectionShell(
      color: AppTheme.blackBar,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Tag('06 / LET’S CONNECT', dark: true),
        const SizedBox(height: 24),
        Text('Have an idea?\nLet’s bring it to life.',
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width < AppTheme.mobileBreakpoint ? 40 : 64,
                height: 1.1,
                letterSpacing: -2,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        const SizedBox(height: 24),
        const Text(
            'For a project, a collaboration, or simply a conversation —\nI’d love to hear what you have in mind.',
            style: TextStyle(color: AppTheme.darkMuted, fontSize: 16, height: 1.8)),
        const SizedBox(height: 28),
        Wrap(spacing: 12, runSpacing: 12, children: [
          FilledButton.icon(
              onPressed: () => openPortfolioLink(context, Uri(scheme: 'mailto', path: portfolioEmail)),
              icon: const Icon(Icons.arrow_outward, size: 18),
              label: const Text('Say hello')),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, side: const BorderSide(color: AppTheme.darkBorder)),
              onPressed: () async {
                await Clipboard.setData(const ClipboardData(text: portfolioEmail));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email address copied')));
                }
              },
              icon: const Icon(Icons.copy_outlined, size: 16),
              label: const Text('Copy email')),
        ]),
        const SizedBox(height: 18),
        const SelectableText(portfolioEmail, style: TextStyle(color: Color(0xFFCBC5E9), fontSize: 14)),
        const SizedBox(height: 46),
        const Divider(color: Color(0xFF3D3D4C)),
        const SizedBox(height: 20),
        Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 32,
            runSpacing: 16,
            children: [
              Text('© ${DateTime.now().year} Riyan Putra Firjatullah',
                  style: const TextStyle(color: AppTheme.darkMuted, fontSize: 12)),
              TextButton(
                  onPressed: () => openPortfolioLink(context, Uri.parse('https://github.com/riyanputraf')),
                  child: const Text('GitHub', style: TextStyle(color: Colors.white))),
              TextButton(
                  onPressed: () =>
                      openPortfolioLink(context, Uri.parse('https://www.instagram.com/riyanputrafirjatullah/')),
                  child: const Text('Instagram', style: TextStyle(color: Colors.white))),
              TextButton.icon(
                  onPressed: onBackToTop,
                  icon: const Icon(Icons.arrow_upward, size: 16, color: Colors.white),
                  label: const Text('Back to top', style: TextStyle(color: Colors.white))),
            ]),
      ]));
}
