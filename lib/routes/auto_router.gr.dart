// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:collection/collection.dart' as _i13;
import 'package:flutter/material.dart' as _i12;
import 'package:nephroscan/features/auth_wrapper/auth_wrapper_screen.dart'
    as _i1;
import 'package:nephroscan/features/ct_scan_screen/domain/entities/report_entity.dart'
    as _i14;
import 'package:nephroscan/features/dashboard_screen/presentation/screens/dashboard_screen.dart'
    as _i4;
import 'package:nephroscan/features/message_screen/presentation/screens/chat_screen.dart'
    as _i2;
import 'package:nephroscan/features/message_screen/presentation/screens/conversation_screen.dart'
    as _i3;
import 'package:nephroscan/features/onboarding_screen/onboarding_screen.dart'
    as _i5;
import 'package:nephroscan/features/reports_screen/presentation/screens/reports_screen.dart'
    as _i6;
import 'package:nephroscan/features/reports_screen/presentation/screens/single_report_screen.dart'
    as _i10;
import 'package:nephroscan/features/setting_screen/setting_screen.dart' as _i7;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_in_screen.dart'
    as _i8;
import 'package:nephroscan/features/sign_in_sign_up_screen/sign_up_screen.dart'
    as _i9;

/// generated route for
/// [_i1.AuthWrapperScreen]
class AuthWrapperRoute extends _i11.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i11.PageRouteInfo>? children})
    : super(AuthWrapperRoute.name, initialChildren: children);

  static const String name = 'AuthWrapperRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthWrapperScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i11.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i12.Key? key,
    required String id,
    required String name,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(key: key, id: id, name: name),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i2.ChatPage(key: args.key, id: args.id, name: args.name);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.id, required this.name});

  final _i12.Key? key;

  final String id;

  final String name;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return key == other.key && id == other.id && name == other.name;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ name.hashCode;
}

/// generated route for
/// [_i3.ConversationScreen]
class ConversationRoute extends _i11.PageRouteInfo<ConversationRouteArgs> {
  ConversationRoute({
    _i12.Key? key,
    required String name,
    required String avatarUrl,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         ConversationRoute.name,
         args: ConversationRouteArgs(
           key: key,
           name: name,
           avatarUrl: avatarUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'ConversationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConversationRouteArgs>();
      return _i3.ConversationScreen(
        key: args.key,
        name: args.name,
        avatarUrl: args.avatarUrl,
      );
    },
  );
}

class ConversationRouteArgs {
  const ConversationRouteArgs({
    this.key,
    required this.name,
    required this.avatarUrl,
  });

  final _i12.Key? key;

  final String name;

  final String avatarUrl;

  @override
  String toString() {
    return 'ConversationRouteArgs{key: $key, name: $name, avatarUrl: $avatarUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConversationRouteArgs) return false;
    return key == other.key &&
        name == other.name &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode => key.hashCode ^ name.hashCode ^ avatarUrl.hashCode;
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.ReportsScreen]
class ReportsRoute extends _i11.PageRouteInfo<ReportsRouteArgs> {
  ReportsRoute({
    _i12.Key? key,
    List<String>? reportIds,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         ReportsRoute.name,
         args: ReportsRouteArgs(key: key, reportIds: reportIds),
         initialChildren: children,
       );

  static const String name = 'ReportsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportsRouteArgs>(
        orElse: () => const ReportsRouteArgs(),
      );
      return _i6.ReportsScreen(key: args.key, reportIds: args.reportIds);
    },
  );
}

class ReportsRouteArgs {
  const ReportsRouteArgs({this.key, this.reportIds});

  final _i12.Key? key;

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
        const _i13.ListEquality<String>().equals(reportIds, other.reportIds);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i13.ListEquality<String>().hash(reportIds);
}

/// generated route for
/// [_i7.SettingScreen]
class SettingRoute extends _i11.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i12.Key? key,
    String? userName,
    String? userEmail,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingRouteArgs>(
        orElse: () => const SettingRouteArgs(),
      );
      return _i7.SettingScreen(
        key: args.key,
        userName: args.userName,
        userEmail: args.userEmail,
      );
    },
  );
}

class SettingRouteArgs {
  const SettingRouteArgs({this.key, this.userName, this.userEmail});

  final _i12.Key? key;

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
/// [_i8.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignInScreen();
    },
  );
}

/// generated route for
/// [_i9.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i10.SingleReportScreen]
class SingleReportRoute extends _i11.PageRouteInfo<SingleReportRouteArgs> {
  SingleReportRoute({
    _i12.Key? key,
    _i14.ReportEntity? report,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         SingleReportRoute.name,
         args: SingleReportRouteArgs(key: key, report: report),
         initialChildren: children,
       );

  static const String name = 'SingleReportRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleReportRouteArgs>(
        orElse: () => const SingleReportRouteArgs(),
      );
      return _i10.SingleReportScreen(key: args.key, report: args.report);
    },
  );
}

class SingleReportRouteArgs {
  const SingleReportRouteArgs({this.key, this.report});

  final _i12.Key? key;

  final _i14.ReportEntity? report;

  @override
  String toString() {
    return 'SingleReportRouteArgs{key: $key, report: $report}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SingleReportRouteArgs) return false;
    return key == other.key && report == other.report;
  }

  @override
  int get hashCode => key.hashCode ^ report.hashCode;
}
