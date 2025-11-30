// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:nephroscan/features/dashboard_screen/dashboard_screen.dart'
    as _i1;
import 'package:nephroscan/features/onboarding_screen/onboarding_screen.dart'
    as _i2;
import 'package:nephroscan/features/reports_screen/presentation/screens/reports_screen.dart'
    as _i3;
import 'package:nephroscan/features/setting_screen/setting_screen.dart' as _i4;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_in_screen.dart'
    as _i5;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_up_screen.dart'
    as _i6;

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.ReportsScreen]
class ReportsRoute extends _i7.PageRouteInfo<void> {
  const ReportsRoute({List<_i7.PageRouteInfo>? children})
    : super(ReportsRoute.name, initialChildren: children);

  static const String name = 'ReportsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.ReportsScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingScreen]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute({List<_i7.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingScreen();
    },
  );
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInScreen();
    },
  );
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignUpScreen();
    },
  );
}
