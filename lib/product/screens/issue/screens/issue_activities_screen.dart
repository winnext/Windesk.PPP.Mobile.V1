import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_issue_activities_card.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_nodata_card.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

@RoutePage()
class IssueActivitiesScreen extends StatelessWidget {
  const IssueActivitiesScreen({super.key, required this.issueCode});

  final String issueCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(
          builder: (context, IssueProvider issueProvider, child) {
            issueProvider.isFetch ? null : issueProvider.getIssueActivities(issueCode);
            return issueProvider.issueActivities.isNotEmpty ? _activitiesBody(size, issueProvider) : const NoDataWidget();
          },
        ));
  }

  SizedBox _activitiesBody(Size size, IssueProvider issueProvider) {
    return SizedBox(
      width: size.width,
      height: size.height / 1.8,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: issueProvider.issueActivities.length + 1,
              itemBuilder: (context, index) {
                if (index == issueProvider.issueActivities.length) return null;
                final model = issueProvider.issueActivities[index];
                return CustomIssueActivitiesCard(data: model);
              },
            ),
          ),
        ],
      ),
    );
  }
}
