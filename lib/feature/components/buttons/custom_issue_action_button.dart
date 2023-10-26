import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/add_activity_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

class CustomIssueActionButton extends StatefulWidget {
  const CustomIssueActionButton({super.key, required this.issueCode});
  final String issueCode;

  @override
  State<CustomIssueActionButton> createState() =>
      _CustomIssueActionButtonState();
}

class _CustomIssueActionButtonState extends State<CustomIssueActionButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(
            builder: (context, IssueProvider issueProvider, child) {
          return FloatingActionButton(
            onPressed: () async {
              final result = await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // Background color
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close))),
                    IssueActionModal(issueCode: widget.issueCode),
                  ],
                ),
              );
              if (result == true) {
                // ignore: use_build_context_synchronously
                context.router
                    .popAndPush(IssueDetailScreen(issueCode: widget.issueCode));
              }
            },
            backgroundColor: APPColors.Modal.red,
            child: const Icon(Icons.add),
          );
        }));
  }
}
