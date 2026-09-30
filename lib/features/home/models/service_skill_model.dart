import 'package:flutter/material.dart';

class ServiceSkillModel {
  const ServiceSkillModel(
      {required this.title, this.asset, this.icon, this.iconColor})
      : assert((asset != null) != (icon != null),
            'Provide either an asset or an icon.');

  final String title;
  final String? asset;
  final IconData? icon;
  final Color? iconColor;
}
