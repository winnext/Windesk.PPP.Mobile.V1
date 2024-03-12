import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_home_button.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';

@RoutePage()
class NewNotifPage extends StatelessWidget {
  NewNotifPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get homeProvider => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const CustomMainAppbar(
          title: Text(
            LocaleKeys.newNotif,
            style: TextStyle(color: Colors.black),
          ),
          returnBack: true,
        ),
        backgroundColor: APPColors.Main.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[homePageIcons(context)],
          ),
        ),
      ),
    );
  }

  Expanded homePageIcons(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          rowIconButtonSection(
              context,
              LocaleKeys.newNotif,
              AppIcons.calendarMonth,
              NewNotifScreen(),
              LocaleKeys.suggestion,
              AppIcons.attachment,
              Suggestion()),
          Expanded(
            flex: 2,
            child: CustomCircularHomeButton(
              title: LocaleKeys.caseComplaintSearch,
              icon: Icon(
                AppIcons.contentPasteSearch,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(CaseSearch());
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          )
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
