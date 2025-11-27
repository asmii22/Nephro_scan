import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/home_screen/home_screen.dart';
import 'package:nephroscan/features/message_screen/message_screen.dart';
import 'package:nephroscan/features/profile_screen/profile_screen.dart';

import '../calendar_screen/presentation/screens/calendar_screen.dart';
import '../ct_scan_screen/presentation/screens/ct_scan_screen.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  static const List<Widget> _tabs = [
    HomeScreen(),
    CalendarScreen(),
    CtScanScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
