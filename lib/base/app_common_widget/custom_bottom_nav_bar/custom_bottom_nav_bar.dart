import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nephroscan/core/injection/injection.dart';

import '../../../features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart';
import '../../assets/assets.dart';
import '../../utils/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, this.currentIndex, this.onTap});

  // Optional external control. If null, the nav bar will use AutoRoute's TabsRouter.
  final int? currentIndex;
  final void Function(int)? onTap;

  void _handleTap(BuildContext context, int index) {
    getIt<NavBarCubit>().updateIndex(index);
    if (onTap != null) {
      onTap!(index);
    } else {
      context.tabsRouter.setActiveIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, navState) {
        final activeIndex = currentIndex ?? context.tabsRouter.activeIndex;
        return Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: activeIndex,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            elevation: 0,
            onTap: (i) => _handleTap(context, i),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedItemColor: AppColors.grey,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            items: getNavItems(context),
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> getNavItems(BuildContext context) {
    // make active icon background transparent
    final bg = Theme.of(context).colorScheme.onTertiary;
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(SVGIcons.home_unselected, width: 24, height: 24),
        activeIcon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              SVGIcons.home_selected,
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SVGIcons.calender_unselected,
          width: 24,
          height: 24,
        ),
        activeIcon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              SVGIcons.calender_selected,
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(SVGIcons.qr_unselected, width: 24, height: 24),
        activeIcon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              SVGIcons.qr_selected,
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SVGIcons.message_unselected,
          width: 24,
          height: 24,
        ),
        activeIcon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              SVGIcons.message_selected,
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SVGIcons.profile_unselected,
          width: 24,
          height: 24,
        ),
        activeIcon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              SVGIcons.profile_selected,
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
      ),
    ];
  }
}
