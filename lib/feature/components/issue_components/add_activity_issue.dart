import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
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
          return DropDownInputFields(
            labelText: LocaleKeys.state,
            onChangedFunction: () {},
            rightIcon: Icons.abc,
            dropDownArray: ['asd'],
          );
        },
      ),
    );
  }
}
