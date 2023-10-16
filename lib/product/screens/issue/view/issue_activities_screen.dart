import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_issue_activities_card.dart';
import 'package:wm_ppp_4/feature/components/loading/custom_loading_indicator.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

@RoutePage()
class IssueActivitiesScreen extends StatelessWidget {
  const IssueActivitiesScreen({super.key, required this.issueCode});

  final String issueCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<IssueProvider>.value(
      value: IssueProvider(),
      child: Consumer<IssueProvider>(
        builder: (context, value, child) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            value.isFetch ? null : value.getIssueActivities(issueCode);
          });
          return value.loading ? const CustomLoadingIndicator() : _activitiesBody(size, context);
        },
      ),
    );
  }

  SizedBox _activitiesBody(Size size, BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 1.8,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<IssueProvider>().issueActivities.length + 1,
              itemBuilder: (context, index) {
                if (index == context.watch<IssueProvider>().issueActivities.length) return null;
                final model = context.watch<IssueProvider>().issueActivities[index];
                return CustomIssueActivitiesCard(data: model);
              },
            ),
          ),
        ],
      ),
    );
  }
}
