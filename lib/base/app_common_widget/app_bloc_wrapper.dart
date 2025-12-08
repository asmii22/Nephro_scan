import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/core/injection/injection.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart';

import '../../features/ct_scan_screen/presentation/cubit/ct_scan_upload_cubit/ct_scan_upload_cubit.dart';
import '../../features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart';
import '../../features/profile_screen/presentation/cubits/get_all_reports_cubit/get_all_reports_cubit.dart';
import '../../features/reports_screen/presentation/cubit/reports_cubit/reports_cubit.dart';

class AppBlocWrapper extends StatelessWidget {
  const AppBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarCubit>(create: (_) => getIt<NavBarCubit>()),
        BlocProvider<UserSignInCubit>(create: (_) => getIt<UserSignInCubit>()),
        BlocProvider<CtScanUploadCubit>(
          create: (_) => getIt<CtScanUploadCubit>(),
        ),
        BlocProvider<UserInfoCubit>(create: (_) => getIt<UserInfoCubit>()),
        BlocProvider<ReportsCubit>(create: (_) => getIt<ReportsCubit>()),
        BlocProvider<GetAllReportsCubit>(
          create: (_) => getIt<GetAllReportsCubit>(),
        ),
      ],
      child: child,
    );
  }
}
