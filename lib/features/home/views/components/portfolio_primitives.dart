import 'package:flutter/material.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: color,
        child: Center(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width < AppTheme.mobileBreakpoint ? 24 : 48, vertical: 64),
                child: child,
              )),
        )),
      );
}

class Tag extends StatelessWidget {
  const Tag(this.text, {super.key, this.dark = false});
  final String text;
  final bool dark;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: dark ? AppTheme.darkTagBackground : AppTheme.tagBackground, borderRadius: BorderRadius.circular(8)),
        child: Text(text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: dark ? Colors.white : AppTheme.primary)),
      );
}

/// Reveal once when the content reaches the reading area.
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({super.key, required this.controller, required this.child});
  final ScrollController controller;
  final Widget child;
  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> with SingleTickerProviderStateMixin {
  late final AnimationController _animation =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  late final CurvedAnimation _opacity = CurvedAnimation(parent: _animation, curve: Curves.easeInOutCubic);
  bool _revealed = false;
  bool _reducedMotion = false;
  final _anchor = GlobalKey();
  bool _scheduled = false;
  bool _listening = false;

  @override
  void initState() {
    super.initState();
    _listen();
  }

  void _listen() {
    if (_revealed || _reducedMotion || _listening) return;
    widget.controller.addListener(_scheduleCheck);
    _listening = true;
  }

  void _stopListening() {
    if (!_listening) return;
    widget.controller.removeListener(_scheduleCheck);
    _listening = false;
  }

  @override
  void didUpdateWidget(covariant ScrollReveal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (_listening) oldWidget.controller.removeListener(_scheduleCheck);
      _listening = false;
      _listen();
    }
    _scheduleCheck();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reducedMotion = MediaQuery.disableAnimationsOf(context);
    if (_reducedMotion) {
      _revealed = true;
      _animation.value = 1;
      _stopListening();
    } else {
      _listen();
      _scheduleCheck();
    }
  }

  // At most one geometry read per frame, after layout has settled.
  void _scheduleCheck() {
    if (_revealed || _scheduled || _reducedMotion) return;
    _scheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduled = false;
      if (!mounted || _revealed || _reducedMotion) return;
      final box = _anchor.currentContext?.findRenderObject();
      if (box is! RenderBox || !box.hasSize) return;
      final top = box.localToGlobal(Offset.zero).dy;
      final viewportHeight = MediaQuery.sizeOf(context).height;
      // SectionShell has 64 px of top padding. Wait until the actual content
      // is inside the reading area, rather than animating empty padding.
      if (top + 64 < viewportHeight * .78 && top + box.size.height > 0) {
        _revealed = true;
        _stopListening();
        _animation.forward();
      }
    });
  }

  @override
  void dispose() {
    _stopListening();
    _opacity.dispose();
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      key: _anchor,
      child: AnimatedBuilder(
        animation: _opacity,
        child: RepaintBoundary(child: widget.child),
        builder: (context, child) => Transform.translate(
          // A fixed distance avoids moving a tall section by hundreds of pixels.
          offset: Offset(0, 56 * (1 - _opacity.value)),
          child: FadeTransition(opacity: _opacity, child: child),
        ),
      ));
}
