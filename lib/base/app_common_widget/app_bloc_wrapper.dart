import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/core/injection/injection.dart';

import '../../features/dashboard_screen/cubits/nav_bar_cubit/nav_bar_cubit.dart';

class AppBlocWrapper extends StatelessWidget {
  const AppBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<NavBarCubit>.value(value: getIt<NavBarCubit>())],
      child: child,
    );
  }
}
