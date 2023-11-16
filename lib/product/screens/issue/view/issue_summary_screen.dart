import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/loading/custom_loading_indicator.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/other/time_functions.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

@RoutePage()
class IssueSummaryScreen extends StatelessWidget {
  const IssueSummaryScreen({super.key, required this.issueCode});
  final String issueCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (context) => IssueProvider(),
        child: Consumer<IssueProvider>(
          builder: (context, IssueProvider issueProvider, child) {
            issueProvider.isFetch
                ? null
                : issueProvider.getIssueSummary(issueCode);
            issueProvider.isFetchSummary
                ? null
                : issueProvider.getIssueTimeInfo(issueCode);
            return issueProvider.loading
                ? const CustomLoadingIndicator()
                : _summaryBody(size, issueProvider);
          },
        ));
  }

  Column _summaryBody(Size size, IssueProvider issueProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: size.width,
            height: size.height / 1.8,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 0, right: 0, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _responseWidget(issueProvider),
                        _fixWidget(issueProvider)
                      ],
                    ),
                    issueSummaryRow(issueProvider.issueSummaryDetail.code,
                        issueProvider.issueSummaryDetail.idate),
                    issueSummaryRow(LocaleKeys.issueSituation,
                        issueProvider.issueSummaryDetail.statusname.toString()),
                    issueSummaryRow(
                        LocaleKeys.description,
                        issueProvider.issueSummaryDetail.description
                            .toString()),
                    issueSummaryRow(LocaleKeys.issueOwner,
                        issueProvider.issueSummaryDetail.contactname),
                    issueSummaryRow(LocaleKeys.space,
                        issueProvider.issueSummaryDetail.locname),
                    issueSummaryRow(LocaleKeys.spaceLoc,
                        issueProvider.issueSummaryDetail.loctree),
                    issueSummaryRow(LocaleKeys.callReason,
                        issueProvider.issueSummaryDetail.title.toString()),
                    issueSummaryRow(
                        LocaleKeys.cfgInfo,
                        issueProvider.issueSummaryDetail.cmdb != null
                            ? issueProvider.issueSummaryDetail.cmdb.toString()
                            : '-'),
                    issueSummaryRow(LocaleKeys.openingDate,
                        issueProvider.issueSummaryDetail.idate.toString()),
                    issueSummaryRow(LocaleKeys.incallNumber,
                        issueProvider.issueSummaryDetail.ani),
                    issueSummaryRow(
                        LocaleKeys.targetResponsed,
                        issueProvider.issueSummaryDetail.targetRdate != null
                            ? TimeClass()
                                .timeRecover(issueProvider
                                    .issueSummaryDetail.targetRdate)
                                .toString()
                            : '-'),
                    issueSummaryRow(
                        LocaleKeys.targetFixed,
                        issueProvider.issueSummaryDetail.targetFdate != null
                            ? TimeClass()
                                .timeRecover(issueProvider
                                    .issueSummaryDetail.targetFdate)
                                .toString()
                            : '-'),
                    issueSummaryRow(
                        LocaleKeys.hys,
                        TimeClass().convertSecToStringFormat(
                            issueProvider.issueSummaryDetail.hys.toString())),
                    issueSummaryRow(
                        LocaleKeys.hds,
                        TimeClass().convertSecToStringFormat(
                            issueProvider.issueSummaryDetail.hds.toString())),
                    issueSummaryRow(
                        LocaleKeys.assignmentGroup,
                        issueProvider.issueSummaryDetail.assignmentgroupname
                            .toString()),
                    issueSummaryRow(LocaleKeys.assigneName,
                        issueProvider.issueSummaryDetail.assigneename),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _fixWidget(IssueProvider issueProvider) {
    return Column(children: [
      issueProvider.issueSummaryTimeInfo.fixTimer == LocaleKeys.zeroStr
          ? upTimeBar(
              issueProvider,
              LocaleKeys.fixedDate,
              issueProvider.issueSummaryTimeInfo.fixTimer != null
                  ? issueProvider.issueSummaryTimeInfo.fixTimer.toString()
                  : '0',
              issueProvider.issueSummaryTimeInfo.targetFdate != null
                  ? issueProvider.issueSummaryTimeInfo.targetFdate.toString()
                  : '0',
              issueProvider.issueSummaryTimeInfo.fixedDate != null
                  ? issueProvider.issueSummaryTimeInfo.fixedDate.toString()
                  : '0000000000000000')
          : upTimeBar(
              issueProvider,
              LocaleKeys.targetFixedDate,
              issueProvider.issueSummaryTimeInfo.fixTimer.toString(),
              issueProvider.issueSummaryTimeInfo.targetFdate != null
                  ? issueProvider.issueSummaryTimeInfo.targetFdate.toString()
                  : '',
              issueProvider.issueSummaryTimeInfo.targetFdate != null
                  ? issueProvider.issueSummaryTimeInfo.targetFdate.toString()
                  : '')
    ]);
  }

  Column _responseWidget(IssueProvider issueProvider) {
    return Column(
      children: [
        issueProvider.issueSummaryTimeInfo.statuscode == LocaleKeys.oPlanned
            ? Container(
                decoration: BoxDecoration(
                    color: APPColors.NewNotifi.blue,
                    borderRadius: BorderRadius.circular(3)),
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(LocaleKeys.plannedIssue),
                    Text(issueProvider.issueSummaryTimeInfo.planneddate),
                  ],
                ),
              )
            : issueProvider.issueSummaryTimeInfo.respondedTimer ==
                    LocaleKeys.zeroStr
                ? upTimeBar(
                    issueProvider,
                    LocaleKeys.responsedDate,
                    issueProvider.issueSummaryTimeInfo.respondedTimer
                        .toString(),
                    issueProvider.issueSummaryTimeInfo.targetRdate.toString(),
                    issueProvider.issueSummaryTimeInfo.respondedDate.toString())
                : upTimeBar(
                    issueProvider,
                    LocaleKeys.targetResponsedDate,
                    issueProvider.issueSummaryTimeInfo.respondedTimer
                        .toString(),
                    issueProvider.issueSummaryTimeInfo.targetRdate?.toString() ??
                        '',
                    issueProvider.issueSummaryTimeInfo.targetRdate?.toString() ??
                        '')
      ],
    );
  }

  Container upTimeBar(
    IssueProvider issueProvider,
    String title,
    String respondedTimer,
    String targetDate,
    String fixedDate,
  ) {
    targetDate == 'null' ||
            targetDate == '' ||
            targetDate == ' '
        ? targetDate = '0000000000000000'
        : null;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title),
          targetDate == '0000000000000000'
              ? Text(
                  TimeClass().timeRecover(respondedTimer == LocaleKeys.zeroStr
                      ? fixedDate
                      : targetDate),
                )
              : Text(
                  TimeClass().timeRecover(respondedTimer == LocaleKeys.zeroStr
                      ? fixedDate
                      : targetDate),
                  style: TimeClass().fixStyle(respondedTimer,
                      targetDate == 'null' ? '0' : targetDate, fixedDate),
                )
        ],
      ),
    );
  }

  Column issueSummaryRow(header, description) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: TextStyle(
                  color: APPColors.Secondary.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                description == 'null' ? '-' : description,
                style: TextStyle(color: APPColors.Secondary.black, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const Divider(
          height: 15,
        ),
      ],
    );
  }
}
