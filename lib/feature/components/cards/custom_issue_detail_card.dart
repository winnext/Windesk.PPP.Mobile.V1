// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/functions/null_check_widget.dart';
import 'package:wm_ppp_4/feature/constants/other/time_functions.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';

import '../../constants/other/colors.dart';

class DetailListWidget extends StatelessWidget {
  final String? code,
      targetFDate,
      targetRDate,
      taskNo,
      description,
      sumdesc1,
      statusName,
      space,
      location,
      idate,
      statusCode,
      planedDate,
      respondedIDate,
      responseTimer,
      fixedTimer,
      fixedIDate,
      timeInfoNow,
      ani,
      id,
      plannedDate,
      contactName,
      locName,
      locTree,
      locTree2,
      title,
      cmdb,
      hys,
      hds,
      assignmentGroup,
      assignmentGroupName,
      assigneName,
      relatedCode,
      cat1,
      contactCode,
      plannedDesc,
      slaCode,
      parentStatus,
      wrondDirect,
      respondedDate,
      respondedTimer,
      fixedDate,
      fixTimer,
      xusercode;

  final Color? importanceLevelColor;
  final VoidCallback? press;
  final bool isIcon;
  final Function onPressed;

  const DetailListWidget(
      {Key? key,
      this.code,
      this.targetFDate,
      this.targetRDate,
      this.space,
      this.taskNo,
      this.description,
      this.sumdesc1,
      this.press,
      this.importanceLevelColor,
      this.statusName,
      this.isIcon = false,
      this.location,
      this.idate,
      this.statusCode,
      this.planedDate,
      required this.onPressed,
      this.respondedIDate,
      this.fixedTimer,
      this.responseTimer,
      this.fixedIDate,
      this.timeInfoNow,
      this.ani,
      this.assigneName,
      this.assignmentGroup,
      this.assignmentGroupName,
      this.cat1,
      this.cmdb,
      this.contactCode,
      this.contactName,
      this.hds,
      this.hys,
      this.id,
      this.locName,
      this.locTree,
      this.locTree2,
      this.parentStatus,
      this.plannedDate,
      this.plannedDesc,
      this.relatedCode,
      this.slaCode,
      this.title,
      this.wrondDirect,
      this.fixTimer,
      this.fixedDate,
      this.respondedDate,
      this.respondedTimer,
      this.xusercode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height / 1.8,
          child: SingleChildScrollView(
            child: Padding(
              padding: CustomPaddings.onlyBottomLow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          statusCode == 'OPlanned'
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: APPColors.NewNotifi.blue,
                                      borderRadius: BorderRadius.circular(3)),
                                  padding: EdgeInsets.all(3),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(LocaleKeys.plannedIssue),
                                      Text(planedDate.toString()),
                                    ],
                                  ),
                                )
                              : respondedTimer == LocaleKeys.oneStr
                                  ? timeBarWidget(
                                      LocaleKeys.targetResponsedDate,
                                      targetRDate,
                                      respondedTimer.toString(),
                                      fixTimer.toString(),
                                      targetFDate.toString(),
                                      fixedDate.toString())
                                  : timeBarWidget(
                                      LocaleKeys.targetResponsed,
                                      respondedDate,
                                      respondedTimer.toString(),
                                      fixTimer.toString(),
                                      targetFDate.toString(),
                                      fixedDate.toString())
                        ],
                      ),
                      Column(children: [
                        fixTimer == LocaleKeys.oneStr
                            ? timeBarWidget(
                                LocaleKeys.targetFixedDate,
                                targetFDate,
                                respondedTimer.toString(),
                                fixTimer.toString(),
                                targetFDate.toString(),
                                fixedDate.toString())
                            : timeBarWidget(
                                LocaleKeys.fixedDate,
                                fixedDate,
                                respondedTimer.toString(),
                                fixTimer.toString(),
                                targetFDate.toString(),
                                fixedDate.toString())
                      ])
                    ],
                  ),
                  Divider(height: 15, color: APPColors.Main.black),
                  issueSummaryRow(code.toString(), description ?? ""),
                  issueSummaryRow(LocaleKeys.issueSituation, statusName ?? ""),
                  issueSummaryRow(LocaleKeys.explanation, description ?? ""),
                  issueSummaryRow(LocaleKeys.issueOwner, contactName ?? ""),
                  issueSummaryRow(LocaleKeys.space, locName ?? ""),
                  issueSummaryRow(LocaleKeys.spaceLoc, locTree ?? ""),
                  issueSummaryRow(LocaleKeys.callReason, title ?? ""),
                  issueSummaryRow(LocaleKeys.callReason, cmdb ?? ""),
                  issueSummaryRow(LocaleKeys.openingDate, idate ?? ""),
                  issueSummaryRow(LocaleKeys.incallNumber, ani ?? ""),
                  issueSummaryRow(LocaleKeys.targetFixed,
                      TimeClass().timeRecover(targetRDate).toString()),
                  issueSummaryRow(LocaleKeys.targetResponsed,
                      TimeClass().timeRecover(targetFDate).toString()),
                  issueSummaryRow(LocaleKeys.hys, hys ?? ""),
                  issueSummaryRow(LocaleKeys.hds, hds ?? ""),
                  issueSummaryRow(
                      LocaleKeys.assignmentGroup, assignmentGroupName ?? ""),
                  issueSummaryRow(LocaleKeys.assigneName, assigneName ?? ""),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container timeBarWidget(String header, targetTime, respondedTime, fixTime,
      targetDate, fixedDate) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(header),
          NullCheckWidget().nullCheckWidget(
              targetTime,
              Text(LocaleKeys.noTimeInfo),
              Text(
                TimeClass().timeRecover(targetTime),
                style: TimeClass()
                    .fixStyle(respondedTime, fixTime, targetDate, fixedDate),
              ))
        ],
      ),
    );
  }

  Column issueSummaryRow(header, description) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: NullCheckWidget().nullCheckWidget(
                  description,
                  Text(LocaleKeys.noInfo),
                  Text(
                    description,
                    style: TextStyle(
                        color: APPColors.Secondary.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )),
          ],
        ),
        Divider(
          height: 15,
        ),
      ],
    );
  }
}
