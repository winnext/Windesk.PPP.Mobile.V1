import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/add_activity_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

class IssueActionButton extends StatelessWidget {
  IssueActionButton({super.key, required this.issueCode});

  String issueCode;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueActionProvider(),
        child: Consumer<IssueActionProvider>(builder: (context, IssueActionProvider issueActionProvider, child) {
          return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => IssueActionModal(issueCode: issueCode)).whenComplete(() {
                issueActionProvider.getAvailableActivities(issueCode);
              });
            },
            backgroundColor: APPColors.Modal.red,
            child: const Icon(Icons.add),
          );
        }));
  }
}
