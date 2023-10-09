import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';

class ChangeCfgScreen extends StatelessWidget {
  ChangeCfgScreen({super.key, required this.issueCode});
  String issueCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IssueActionProvider(),
      child: Consumer<IssueActionProvider>(builder: (context, IssueActionProvider issueActionProvider, child) {
        return _changeCfgBody(context, issueActionProvider);
      }),
    );
  }

  SingleChildScrollView _changeCfgBody(BuildContext context, IssueActionProvider issueActionProvider) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.09,
        height: MediaQuery.of(context).size.height * 0.5,
        color: APPColors.Main.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldsInputWithActionAndController(
                textController: issueActionProvider.entityCode,
                labelText: LocaleKeys.entityCode,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanEntityCode),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldsInputWithActionAndController(
                textController: issueActionProvider.serialNumber,
                labelText: LocaleKeys.serialNumber,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanSerialNumber),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldsInputWithActionAndController(
                textController: issueActionProvider.rfidCode,
                labelText: LocaleKeys.rfid,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanRfid),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldsInputWithActionAndController(
                textController: issueActionProvider.spaceCode,
                labelText: LocaleKeys.spaceCode,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanSpace),
          ),
          _saveOrQuit(context, issueActionProvider)
        ]),
      ),
    );
  }

  Padding _saveOrQuit(BuildContext context, IssueActionProvider issueActionProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomHalfButtons(
          leftTitle: const Text(
            AppStrings.clean,
            style: TextStyle(color: Colors.white),
          ),
          rightTitle: const Text(AppStrings.save, style: TextStyle(color: Colors.white)),
          leftOnPressed: () {
            Navigator.pop(context);
          },
          rightOnPressed: () {
            issueActionProvider.changeCfg(issueCode);
          }),
    );
  }
}
