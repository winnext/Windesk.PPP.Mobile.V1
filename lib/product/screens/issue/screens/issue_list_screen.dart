import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../provider/issue_provider.dart';

@RoutePage()
class IssueList extends StatelessWidget {
  IssueList({super.key, required this.issueModuleCode});

  String issueModuleCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(builder: (context, IssueProvider issueProvider, child) {
          issueProvider.isFetch ? null : issueProvider.getIssueList(1, issueModuleCode);
          return Scaffold(
            appBar: const CustomMainAppbar(title: const Text('İş Emri Listesi')),
            body: const Text('asd'),
          );
        }));
  }
}
