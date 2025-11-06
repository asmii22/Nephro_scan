import 'package:flutter/material.dart';
import 'package:nephroscan/routes/auto_router.dart';
import 'package:nephroscan/theme/app_theme.dart';
import 'package:nephroscan/theme/theme_manager.dart';

import 'core/injection/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection('dev');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeManager themeManager = ThemeManager();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NephroScan',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeManager.themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
