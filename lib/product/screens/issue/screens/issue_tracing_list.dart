import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/cards/custom_tracing_list_card.dart';
import 'package:vm_fm_4/feature/models/issue_models/issue_tracing_list_model.dart';
import 'package:vm_fm_4/product/screens/issue/provider/issue_provider.dart';
import 'package:vm_fm_4/product/screens/issue/service/issue_service_repo.dart';

import '../service/issue_service_repo_impl.dart';

@RoutePage()
class IssueTracingList extends StatefulWidget {
  const IssueTracingList({super.key});

  @override
  State<IssueTracingList> createState() => _IssueTracingListState();
}

class _IssueTracingListState extends State<IssueTracingList> {
  int l = -1;
  @override
  void initState() {
    IssueServiceRepository issueService = IssueServiceRepoImpml();
    issueService.getIssueTracingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(builder: (context, IssueProvider issueProvider, child) {
          return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: context.read<IssueProvider>().tracingList.length,
                        itemBuilder: (BuildContext context, int i) {
                          l++;
                          if (l == 5) {
                            l = 0;
                          }
                          IssueTracingListModel tracingListElement = context.read<IssueProvider>().tracingList[l];
                          return CustomTracingList(
                              title: tracingListElement.name.toString(),
                              count: tracingListElement.count.toString(),
                              code: tracingListElement.code.toString());
                        }),
                  )
                ],
              ));
        }));
  }
}
