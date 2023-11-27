import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';

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
    return WillPopScope(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          rowIconButtonSection(
              context,
              LocaleKeys.issueSearchPage,
              AppIcons.issueSearchIcon,
              const IssueSearchRoute(),
              LocaleKeys.assetSearchPage,
              AppIcons.assetSearchIcon,
              const AssetSearchRoute(),
              true),
          rowIconButtonSection(
              context,
              LocaleKeys.spaceSearchPage,
              AppIcons.spaceSearchIcon,
              const SpaceSearchRoute(),
              LocaleKeys.workOrderSearch,
              AppIcons.woSearchIcon,
              const WoSearchRoute(),
              ServiceTools.isWorkOrderExist),
        ],
      ),
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Çıkış'),
              content: const Text(
                  'Uygulamadan çıkış yapılacak, devam etmek istiyor musunuz?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Evet'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'Hayır',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
    );
  }

  Widget rowIconButtonSection(
      BuildContext context,
      String buttonTitle1,
      IconData buttonIcon1,
      PageRouteInfo<dynamic> navigateRouteName1,
      String buttonTitle2,
      IconData buttonIcon2,
      PageRouteInfo<dynamic> navigateRouteName2,
      bool secondButtonExist) {
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
            secondButtonExist
                ? CustomCircularHomeButton(
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
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
