import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:nephroscan/features/home_screen/home_screen.dart';
import 'package:nephroscan/features/message_screen/message_screen.dart';
import 'package:nephroscan/features/profile_screen/presentation/screens/profile_screen.dart';

import '../../../calendar_screen/presentation/screens/calendar_screen.dart';
import '../../../ct_scan_screen/presentation/screens/ct_scan_screen.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  late final UserInfoCubit _userInfoCubit;

  @override
  void initState() {
    super.initState();
    _userInfoCubit = context.read<UserInfoCubit>();
    _userInfoCubit.getUserInfo();
  }

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        return state.when(
          initial: () => Scaffold(body: SizedBox.shrink()),
          loading: () => Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.appearance),
            ),
          ),
          success: (userModel) {
            return Scaffold(
              body: IndexedStack(
                index: _currentIndex,
                children: [
                  HomeScreen(
                    username: userModel?.name,
                    email: userModel?.email,
                  ),
                  CalendarScreen(),
                  CtScanScreen(),
                  MessageScreen(),
                  ProfileScreen(userModel: userModel),
                ],
              ),
              bottomNavigationBar: CustomBottomNavBar(
                currentIndex: _currentIndex,
                onTap: _onNavTap,
              ),
            );
          },
          error: (_) {
            return Scaffold(
              body: Center(child: Text('Error loading user info')),
            );
          },
        );
      },
    );
  }
}
