import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/core/injection/injection.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart';

import '../../features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart';

class AppBlocWrapper extends StatelessWidget {
  const AppBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarCubit>(create: (_) => getIt<NavBarCubit>()),
        BlocProvider<UserSignInCubit>(create: (_) => getIt<UserSignInCubit>()),
      ],
      child: child,
    );
  }
}
