import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';

// ignore: must_be_immutable
class AddQuickFix extends StatelessWidget {
  const AddQuickFix({super.key, required this.issueCode});
  final String issueCode;

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
    if (issueActionProvider.isSuccessEnterActivityForFixed) {
      snackBar(context, LocaleKeys.processDone, 'success');
      Navigator.of(context).pop<bool>(true);
    }
    if (issueActionProvider.errorAccurForFixed) {
      snackBar(context, LocaleKeys.processCancell, 'error');
      Navigator.of(context).pop<bool>(false);
    }
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.09,
        color: APPColors.Main.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(LocaleKeys.quickFix, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text(LocaleKeys.quickFixDescription, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            TextFieldsInputWithActionAndController(
                textController: issueActionProvider.spaceCode,
                labelText: LocaleKeys.spaceCode,
                actionIcon: AppIcons.qr,  
                actionFunction: issueActionProvider.scanSpace),
            TextFieldsInputWithActionAndController(
                textController: issueActionProvider.patientBarcode,
                labelText: LocaleKeys.patientBarcode,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanPatientBarcode),
            TextFieldsInputWithActionAndController(
                textController: issueActionProvider.sampleBarcode,
                labelText: LocaleKeys.sampleBarcode,
                actionIcon: AppIcons.qr,
                actionFunction: issueActionProvider.scanSampleBarcode),
            _saveOrQuit(context, issueActionProvider)
          ]),
        ),
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
            issueActionProvider.saveIssueActivityForFixed(issueCode, 'AR00000000174');
          }),
    );
  }
}
