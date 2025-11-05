import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'auto_router.gr.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      path: '/SignIn',
      page: SignIn.page,
      children: [
        AutoRoute(path: '/Login', page: LoginRoute.page, initial: true),
        AutoRoute(path: '/Register', page: Register.page),
      ],
    ),
  ];
}
