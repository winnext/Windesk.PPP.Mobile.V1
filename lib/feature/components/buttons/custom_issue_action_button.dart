import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/add_activity_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

// ignore: must_be_immutable
class IssueActionButton extends StatefulWidget {
  IssueActionButton({super.key, required this.issueCode});

  String issueCode;

  @override
  State<IssueActionButton> createState() => _IssueActionButtonState();
}

class _IssueActionButtonState extends State<IssueActionButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(builder: (context, IssueProvider issueProvider, child) {
          return FloatingActionButton(
            onPressed: () async {
              final result = await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => IssueActionModal(issueCode: widget.issueCode),
              );
              if (result == true) {
                // ignore: use_build_context_synchronously
                context.router.popAndPush(IssueDetailScreen(issueCode: widget.issueCode));
              }
            },
            backgroundColor: APPColors.Modal.red,
            child: const Icon(Icons.add),
          );
        }));
  }
}
