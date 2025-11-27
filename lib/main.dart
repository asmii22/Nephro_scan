import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/app_common_widget/app_bloc_wrapper.dart';
import 'package:nephroscan/firebase_options.dart';
import 'package:nephroscan/routes/auto_router.dart';
import 'package:nephroscan/theme/app_theme.dart';
import 'package:nephroscan/theme/theme_manager.dart';

import 'core/injection/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureInjection('dev');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager themeManager = ThemeManager();
  late final AppRouter _router;
  @override
  void initState() {
    super.initState();
    _router = getIt<AppRouter>();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBlocWrapper(
      child: MaterialApp.router(
        title: 'NephroScan',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeManager.themeMode,
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(),
      ),
    );
  }
}
