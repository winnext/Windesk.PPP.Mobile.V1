import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_with_text_button.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/search/screens/wo_search/provider/wo_search_provider.dart';

import '../../../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../../../feature/constants/other/app_strings.dart';

@RoutePage()
class WoSearchPage extends StatelessWidget {
  const WoSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WoSearchProvider(),
        child: Consumer<WoSearchProvider>(builder: (context, WoSearchProvider woSearchProvider, child) {
          return Scaffold(
            appBar: const CustomTabAppbar(
              title: AppStrings.workOrderSearch,
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
                          woSearchProvider.setSearchWoCode = val;
                        },
                        labelText: 'İş Emri No'),
                  ),
                  const Divider(),
                  const Divider(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CustomCircularWithTextButton(
                        bgColor: APPColors.Login.blue,
                        onPressFunction: () {
                          woSearchProvider.printSearchData(context);
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
