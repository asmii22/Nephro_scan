import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/SignIn', page: SignInRoute.page, initial: true),
    AutoRoute(path: '/SignUp', page: SignUpRoute.page),
    AutoRoute(path: '/Onboarding', page: OnboardingRoute.page),
    AutoRoute(path: '/Dashboard', page: DashboardRoute.page),
    AutoRoute(path: '/Setting', page: SettingRoute.page),
  ];
}
