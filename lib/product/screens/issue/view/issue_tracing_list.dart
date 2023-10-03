import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_tracing_list_card.dart';
import '../../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../../feature/l10n/locale_keys.g.dart';
import '../../../../../feature/models/issue_models/issue_tracing_list_model.dart';

@RoutePage()
class IssueTracingList extends StatefulWidget {
  const IssueTracingList({super.key});

  @override
  State<IssueTracingList> createState() => _IssueTracingListState();
}

class _IssueTracingListState extends State<IssueTracingList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(builder: (context, IssueProvider issueProvider, child) {
          issueProvider.isFetch ? null : issueProvider.getIssueTracingList();
          return Scaffold(
              appBar: const CustomMainAppbar(
                title: Text(LocaleKeys.vakalist),
                returnBack: true,
              ),
              body: issueProvider.loading
                  ? const CustomLoadingIndicator()
                  : Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              itemCount: issueProvider.tracingList.length,
                              itemBuilder: (BuildContext context, int index) {
                                IssueTracingListModel tracingListElement = issueProvider.tracingList[index];
                                return CustomTracingList(
                                  title: tracingListElement.name.toString(),
                                  count: tracingListElement.count.toString(),
                                  code: tracingListElement.code.toString(),
                                  isWorkOrder: false,
                                );
                              }),
                        )
                      ],
                    ));
        }));
  }
}
