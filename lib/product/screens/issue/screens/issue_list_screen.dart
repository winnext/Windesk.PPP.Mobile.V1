import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/cards/custom_issue_list_card.dart';
import '../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../feature/l10n/locale_keys.g.dart';
import '../provider/issue_provider.dart';

import '../../../../feature/models/issue_models/issue_list_model.dart';

@RoutePage()
class IssueListScreen extends StatelessWidget {
  const IssueListScreen({super.key, required this.issueModuleCode});

  final String issueModuleCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(builder: (context, IssueProvider issueProvider, child) {
          issueProvider.isFetch ? null : issueProvider.getIssueList(1, issueModuleCode);
          return Scaffold(
            appBar: const CustomMainAppbar(
              title: Text(LocaleKeys.issueList),
              returnBack: true,
            ),
            body: Stack(children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: issueProvider.notificationController,
                      child: ListView.builder(
                          itemCount: context.read<IssueProvider>().issueList.length,
                          itemBuilder: (BuildContext context, int index) {
                            IssueListModel issueListElement = context.read<IssueProvider>().issueList[index];
                            return CustomIssueListCard(
                                code: issueListElement.code.toString(),
                                statusCode: issueListElement.statuscode.toString(),
                                targetFDate: issueListElement.target_fdate.toString(),
                                targetRDate: issueListElement.target_rdate.toString(),
                                description: issueListElement.description.toString(),
                                sumdesc1: issueListElement.sumdec1.toString(),
                                statusName: issueListElement.statusname.toString(),
                                space: issueListElement.space.toString(),
                                location: issueListElement.location.toString(),
                                idate: issueListElement.idate.toString(),
                                planedDate: issueListElement.planneddate.toString(),
                                respondedIDate: issueListElement.responded_idate.toString(),
                                responseTimer: issueListElement.response_timer.toString(),
                                fixedTimer: issueListElement.fixed_timer.toString(),
                                fixedIDate: issueListElement.fixed_idate.toString(),
                                onPressed: () {},
                                onPressedLong: () {});
                          }),
                    ),
                  ),
                ],
              ),
              issueProvider.loading ? const CustomLoadingIndicator() : const SizedBox()
            ]),
          );
        }));
  }
}
