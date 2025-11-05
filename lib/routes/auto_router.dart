import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];
}
