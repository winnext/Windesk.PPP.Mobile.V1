import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_with_text_button.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/constants/functions/invalid_device_id_check.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/provider/issue_search_provider.dart';

import '../../../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../../../feature/constants/other/app_strings.dart';

@RoutePage()
class IssueSearchPage extends StatelessWidget {
  const IssueSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    InvalidDeviceId().check(context);
    return ChangeNotifierProvider(
        create: (context) => IssueSearchProvider(),
        child: Consumer<IssueSearchProvider>(
            builder: (context, IssueSearchProvider issueSearchProvider, child) {
        

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
                        onChangedFunction: (val) {
                          issueSearchProvider.setSearchIssueCode = val;
                        },
                        labelText: 'Vaka No'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CustomCircularWithTextButton(
                        bgColor: APPColors.Login.blue,
                        onPressFunction: () {
                          issueSearchProvider.printSearchData(context);
                        },
                        textButton: 'Ara',
                        textColor: APPColors.Main.white),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
