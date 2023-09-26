import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_issue_attachments_card.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_nodata_card.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

@RoutePage()
class IssueFilesScreen extends StatelessWidget {
  const IssueFilesScreen({super.key, required this.issueCode});

  final String issueCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(
          builder: (context, IssueProvider issueProvider, child) {
            issueProvider.isFetchAttachment ? null : issueProvider.getIssueAttachment(issueCode);
            return issueProvider.issueAttachmentList.isNotEmpty ? _filesBody(size, issueProvider) : const NoDataWidget();
          },
        ));
  }

  SizedBox _filesBody(Size size, IssueProvider issueProvider) {
    return SizedBox(
            width: size.width,
            height: size.height / 1.8,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: issueProvider.issueAttachmentList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == issueProvider.issueAttachmentList.length) return null;
                      final model = issueProvider.issueAttachmentList[index];
                      return CustomIssueAttachmentsCard(data: model);
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
