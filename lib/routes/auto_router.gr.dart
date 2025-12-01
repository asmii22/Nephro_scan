// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:collection/collection.dart' as _i10;
import 'package:flutter/material.dart' as _i9;
import 'package:nephroscan/features/auth_wrapper/auth_wrapper_screen.dart'
    as _i1;
import 'package:nephroscan/features/dashboard_screen/presentation/screens/dashboard_screen.dart'
    as _i2;
import 'package:nephroscan/features/onboarding_screen/onboarding_screen.dart'
    as _i3;
import 'package:nephroscan/features/reports_screen/presentation/screens/reports_screen.dart'
    as _i4;
import 'package:nephroscan/features/setting_screen/setting_screen.dart' as _i5;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_in_screen.dart'
    as _i6;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_up_screen.dart'
    as _i7;

/// generated route for
/// [_i1.AuthWrapperScreen]
class AuthWrapperRoute extends _i8.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(AuthWrapperRoute.name, initialChildren: children);

  static const String name = 'AuthWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthWrapperScreen();
    },
  );
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i4.ReportsScreen]
class ReportsRoute extends _i8.PageRouteInfo<ReportsRouteArgs> {
  ReportsRoute({
    _i9.Key? key,
    List<String>? reportIds,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ReportsRoute.name,
         args: ReportsRouteArgs(key: key, reportIds: reportIds),
         initialChildren: children,
       );

  static const String name = 'ReportsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportsRouteArgs>(
        orElse: () => const ReportsRouteArgs(),
      );
      return _i4.ReportsScreen(key: args.key, reportIds: args.reportIds);
    },
  );
}

class ReportsRouteArgs {
  const ReportsRouteArgs({this.key, this.reportIds});

  final _i9.Key? key;

  final List<String>? reportIds;

  @override
  String toString() {
    return 'ReportsRouteArgs{key: $key, reportIds: $reportIds}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportsRouteArgs) return false;
    return key == other.key &&
        const _i10.ListEquality<String>().equals(reportIds, other.reportIds);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i10.ListEquality<String>().hash(reportIds);
}

/// generated route for
/// [_i5.SettingScreen]
class SettingRoute extends _i8.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i9.Key? key,
    String? userName,
    String? userEmail,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         SettingRoute.name,
         args: SettingRouteArgs(
           key: key,
           userName: userName,
           userEmail: userEmail,
         ),
         initialChildren: children,
       );

  static const String name = 'SettingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingRouteArgs>(
        orElse: () => const SettingRouteArgs(),
      );
      return _i5.SettingScreen(
        key: args.key,
        userName: args.userName,
        userEmail: args.userEmail,
      );
    },
  );
}

class SettingRouteArgs {
  const SettingRouteArgs({this.key, this.userName, this.userEmail});

  final _i9.Key? key;

  final String? userName;

  final String? userEmail;

  @override
  String toString() {
    return 'SettingRouteArgs{key: $key, userName: $userName, userEmail: $userEmail}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingRouteArgs) return false;
    return key == other.key &&
        userName == other.userName &&
        userEmail == other.userEmail;
  }

  @override
  int get hashCode => key.hashCode ^ userName.hashCode ^ userEmail.hashCode;
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignInScreen();
    },
  );
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignUpScreen();
    },
  );
}
