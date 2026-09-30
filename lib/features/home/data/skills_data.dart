import 'package:flutter/material.dart';
import 'package:my_portofolio/features/home/models/service_skill_model.dart';

/// Editable portfolio skills content.
abstract final class SkillsData {
  static const skills = ['FLUTTER', 'FIREBASE', 'iOS', 'ANDROID', 'GIT'];

  static const serviceSkills = [
    ServiceSkillModel(title: 'Flutter', asset: 'assets/skills/flutter.png'),
    ServiceSkillModel(
      title: 'Android',
      asset: 'assets/skills/android.png',
    ),
    ServiceSkillModel(
        title: 'Firebase',
        icon: Icons.local_fire_department,
        iconColor: Color(0xFFEF6C00)),
    ServiceSkillModel(title: 'iOS', icon: Icons.apple),
    ServiceSkillModel(title: 'API', asset: 'assets/skills/api.png'),
    ServiceSkillModel(title: 'GIT', asset: 'assets/skills/git.png'),
  ];
}
