import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/functions/invalid_device_id_check.dart';

import '../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../../feature/constants/other/app_icons.dart';
import '../../../../feature/constants/other/app_strings.dart';
import '../../../../feature/l10n/locale_keys.g.dart';
import '../../../../feature/route/app_route.gr.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InvalidDeviceId().check(context);
    return WillPopScope(
      child: Scaffold(
        appBar: const CustomTabAppbar(title: AppStrings.searchTab),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: SizedBox()),
              searchPageIcons(context),
            ],
          ),
        ),
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

  Expanded searchPageIcons(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rowIconButtonSection(
              context,
              LocaleKeys.issueSearch,
              AppIcons.caseSLASearchIcon,
              const IssueSearchRoute(),
              LocaleKeys.entitySearchTitle,
              AppIcons.entitySearchIcon,
              const AssetSearchRoute()),
          rowIconButtonSection(
              context,
              LocaleKeys.mahalSearchTitle,
              AppIcons.mahalSearchIcon,
              const AssetSearchRoute(),

              //const WorkOrderScreen(),
              LocaleKeys.workOrderSearch,
              AppIcons.workOrderSearchIcon,
              const SearchWorkOrderScreen()),
        ],
      ),
    );
  }

  Expanded rowIconButtonSection(
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
