import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_with_text_button.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_login_button.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';

import '../../../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../../../feature/components/buttons/custom_circular_home_button.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/l10n/locale_keys.g.dart';
import '../../../../../../feature/route/app_route.gr.dart';

@RoutePage()
class IssueSearchPage extends StatelessWidget {
  const IssueSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    test() {}
    return Scaffold(
      appBar: const CustomTabAppbar(
        title: AppStrings.caseSlaSearch,
        returnBack: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.09,
              child: TextFieldsInput(
                  onChangedFunction: test, labelText: 'Vaka No'),
            ),
            Divider(),
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: CustomCircularWithTextButton(
                  bgColor: APPColors.Main.blue,
                  onPressFunction: test,
                  textButton: 'Ara',
                  textColor: APPColors.Main.white),
            )
          ],
        ),
      ),
    );
  }
}
