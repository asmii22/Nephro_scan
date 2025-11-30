import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/app_common_widget/app_bloc_wrapper.dart';
import 'package:nephroscan/firebase_options.dart';
import 'package:nephroscan/routes/auto_router.dart';
import 'package:nephroscan/theme/app_theme.dart';
import 'package:nephroscan/theme/theme_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/injection/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('🔴 Flutter Error: ${details.exception}');
    debugPrint('Stack trace: ${details.stack}');
  };

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureInjection('dev');

  await _requestPermissions();

  runApp(MyApp());
}

Future<void> _requestPermissions() async {
  try {
    final storageStatus = await Permission.storage.status;
    if (storageStatus.isDenied) {
      await Permission.storage.request();
    }

    final cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    }

    final photosStatus = await Permission.photos.status;
    if (photosStatus.isDenied) {
      await Permission.photos.request();
    }
  } catch (e) {
    debugPrint('🟡 Permission request error: $e');
  }
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

    _router.addListener(() {
      debugPrint('🧭 Current route: ${_router.current.name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapper(
      child: MaterialApp.router(
        title: 'NephroScan',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeManager.themeMode,
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(
          navigatorObservers: () => [AppRouteObserver()],
        ),
      ),
    );
  }
}

class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🟢 Pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🔙 Popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint(
      '🔄 Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🗑️ Removed: ${route.settings.name}');
  }
}
