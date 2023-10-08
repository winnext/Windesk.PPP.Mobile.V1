import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';

class AddActivity extends StatelessWidget {
  AddActivity({super.key, required this.issueCode});
  String issueCode;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IssueActionProvider(),
      child: Consumer<IssueActionProvider>(
        builder: (context, IssueActionProvider issueActionProvider, child) {
          issueActionProvider.isFetchActivity ? issueActionProvider.getAvailableActivities(issueCode) : null;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width / 1.09,
              color: APPColors.Main.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownInputFields(
                      labelText: LocaleKeys.state,
                      onChangedFunction: (item) {
                        issueActionProvider.setSelectedActivityName(item.toString());
                      },
                      rightIcon: Icons.arrow_drop_down,
                      dropDownArray: issueActionProvider.availableActivitiesName,
                    ),),
                    const Divider(thickness: 2),
                    Text('Bu aktivitenin girilmesi, talebin durumunu ${issueActionProvider.selectedActivityName} olarak değiştirecektir.'),
                    issueActionProvider.selectedActivity[0].barcodeSpace == 'Y' ?  
                    TextFieldsInputWithActionAndController(
                        textController: issueActionProvider.spaceCode,
                        labelText: AppStrings.space,
                        actionIcon: AppIcons.qr,
                        actionFunction: issueActionProvider.scanSpace)
                  : Container(),
                    issueActionProvider.selectedActivity[0].additionaltimeInput == 'Y' ?  
                    TextFieldsInput(labelText: LocaleKeys.addMoreTime, onChangedFunction: (){},)

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
