import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../feature/constants/other/app_icons.dart';
import '../../../feature/constants/other/app_strings.dart';
import '../../../feature/l10n/locale_keys.g.dart';
import '../../../feature/route/app_route.gr.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomTabAppbar(title: AppStrings.searchTab),
        body: Center(child: _bodyWidget(context)));
  }

  Widget _bodyWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowIconButtonSection(
            context,
            LocaleKeys.issueSearchPage,
            AppIcons.issueSearchIcon,
            const IssueSearchRoute(),
            LocaleKeys.assetSearchPage,
            AppIcons.assetSearchIcon,
            const AssetSearchRoute()),
        rowIconButtonSection(
            context,
            LocaleKeys.spaceSearchPage,
            AppIcons.spaceSearchIcon,
            const TestScreen(),
            LocaleKeys.workOrderSearch,
            AppIcons.woSearchIcon,
            const IssueSearchRoute()),
      ],
    );
  }

  Widget rowIconButtonSection(
      BuildContext context,
      String buttonTitle1,
      IconData buttonIcon1,
      PageRouteInfo<dynamic> navigateRouteName1,
      String buttonTitle2,
      IconData buttonIcon2,
      PageRouteInfo<dynamic> navigateRouteName2) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCircularHomeButton(
              title: buttonTitle1,
              icon: Icon(
                buttonIcon1,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(navigateRouteName1);
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
            CustomCircularHomeButton(
              title: buttonTitle2,
              icon: Icon(
                buttonIcon2,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(navigateRouteName2);
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          ],
        ),
      ),
    );
  }
}
