import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio/configs/pages/app_page.dart';
import 'package:my_portofolio/configs/routes/app_routes.dart';
import 'package:my_portofolio/configs/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortofolioApp());
}

class PortofolioApp extends StatelessWidget {
  const PortofolioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Riyan - Flutter Developer',
      theme: AppTheme.light,
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
