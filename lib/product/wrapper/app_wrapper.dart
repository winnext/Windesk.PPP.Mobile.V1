import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';

import '../../feature/constants/other/app_icons.dart';
import '../../feature/constants/other/app_strings.dart';
import '../../feature/route/app_route.gr.dart';

@RoutePage()
class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeScreen(),
        ServiceTools.isWorkOrderExist ? NewOrderScreen() : IssueSearchRoute(),
        SearchScreen(),
        TestScreen(),
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: tabsRouter.activeIndex,
            onItemSelected: tabsRouter.setActiveIndex,
            items: [
              BottomNavyBarItem(title: const Text(AppStrings.homeTab), icon: const Icon(AppIcons.home)),
              ServiceTools.isWorkOrderExist
                  ? BottomNavyBarItem(title: const Text(AppStrings.newOrderTab), icon: const Icon(AppIcons.addBox))
                  : BottomNavyBarItem(title: const Text(AppStrings.search), icon: const Icon(AppIcons.issueSearchIcon)),
              BottomNavyBarItem(title: const Text(AppStrings.searchTab), icon: const Icon(AppIcons.search)),
              BottomNavyBarItem(title: const Text(AppStrings.testTab), icon: const Icon(AppIcons.wifi)),
            ],
          ),
        );
      },
    );
  }
}
