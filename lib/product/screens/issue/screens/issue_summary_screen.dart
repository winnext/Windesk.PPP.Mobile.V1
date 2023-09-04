import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            issueProvider.isFetch ? null : issueProvider.getIssueSummary(issueCode);
            return Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 1.8,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Column(
                              //   children: [
                              //     issueProvider.issueSummaryDetail.statuscode == 'OPlanned'
                              //         ? Container(
                              //             decoration: BoxDecoration(color: APPColors.NewNotifi.blue, borderRadius: BorderRadius.circular(3)),
                              //             padding: EdgeInsets.all(3),
                              //             child: Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //               children: [
                              //                 Text('Randevulu Vakadır'),
                              //                 Text(issueProvider.issueSummaryDetail.planneddate.toString()),
                              //               ],
                              //             ),
                              //           )
                              //         : issueProvider.issueSummaryDetail.responsedTimer == '1'
                              //             ? Container(
                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                              //                 padding: EdgeInsets.all(3),
                              //                 child: Column(
                              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //                   children: [
                              //                     Text('Hedef Yanıtlama Tarihi'),
                              //                     issueProvider.issueSummaryDetail.targetRdate == ''
                              //                         ? Text('')
                              //                         : Text(
                              //                             timeRecover(issueProvider.issueSummaryDetail.targetRdate).toString(),
                              //                             style: fixStyle(issueProvider.issueSummaryDetail.respondedTimer.toString(), issueProvider.issueSummaryDetail.fixTimer.toString(),
                              //                                 issueProvider.issueSummaryDetail.targetFDate.toString(), issueProvider.issueSummaryDetail.fixedDate.toString()),
                              //                           )
                              //                   ],
                              //                 ),
                              //               )
                              //             : Container(
                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                              //                 margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              //                 padding: EdgeInsets.all(3),
                              //                 child: Column(
                              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //                   children: [
                              //                     Text('Yanıtlama Tarihi'),
                              //                     issueProvider.issueSummaryDetail.respondedDate == ''
                              //                         ? Text('')
                              //                         : Text(
                              //                             timeRecover(issueProvider.issueSummaryDetail.respondedDate).toString(),
                              //                             style: fixStyle(issueProvider.issueSummaryDetail.respondedTimer.toString(), issueProvider.issueSummaryDetail.fixTimer.toString(),
                              //                                 issueProvider.issueSummaryDetail.targetFDate.toString(), issueProvider.issueSummaryDetail.fixedDate.toString()),
                              //                           ),
                              //                   ],
                              //                 ),
                              //               ),
                              //   ],
                              // ),
                              // Column(children: [
                              //   issueProvider.issueSummaryDetail.fixtimer == '1'
                              //       ? Container(
                              //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                              //           padding: EdgeInsets.all(3),
                              //           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //             children: [
                              //               Text('Hedef Düzeltme Tarihi'),
                              //               issueProvider.issueSummaryDetail.targetFDate == ''
                              //                   ? Text('')
                              //                   : Text(
                              //                       timeRecover(issueProvider.issueSummaryDetail.targetFDate).toString(),
                              //                       style: fixStyle(issueProvider.issueSummaryDetail.respondedTimer.toString(), issueProvider.issueSummaryDetail.fixTimer.toString(),
                              //                           issueProvider.issueSummaryDetail.targetFDate.toString(), issueProvider.issueSummaryDetail.fixedDate.toString()),
                              //                     ),
                              //             ],
                              //           ),
                              //         )
                              //       : Container(
                              //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                              //           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              //           padding: EdgeInsets.all(3),
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //             children: [
                              //               Text('Düzeltme Tarihi'),
                              //               issueProvider.issueSummaryDetail.fixedDate == ''
                              //                   ? Text('')
                              //                   : Text(
                              //                       timeRecover(issueProvider.issueSummaryDetail.fixedDate).toString(),
                              //                       style: fixStyle(issueProvider.issueSummaryDetail.respondedTimer.toString(), issueProvider.issueSummaryDetail.fixTimer.toString(),
                              //                           issueProvider.issueSummaryDetail.targetFDate.toString(), issueProvider.issueSummaryDetail.fixedDate.toString()),
                              //                     ),
                              //             ],
                              //           ),
                              //         ),
                              // ])
                            ],
                          ),
                          issueSummaryRow(issueProvider.issueSummaryDetail.code, issueProvider.issueSummaryDetail.idate),
                          issueSummaryRow(LocaleKeys.issueSituation, issueProvider.issueSummaryDetail.statusname.toString()),
                          issueSummaryRow(LocaleKeys.description, issueProvider.issueSummaryDetail.description.toString()),
                          issueSummaryRow(LocaleKeys.issueOwner, issueProvider.issueSummaryDetail.contactname.toString()),
                          issueSummaryRow(LocaleKeys.space, issueProvider.issueSummaryDetail.locname.toString()),
                          issueSummaryRow(LocaleKeys.spaceLoc, issueProvider.issueSummaryDetail.loctree.toString()),
                          issueSummaryRow(LocaleKeys.callReason, issueProvider.issueSummaryDetail.title.toString()),
                          issueSummaryRow(LocaleKeys.cfgInfo, issueProvider.issueSummaryDetail.cmdb.toString()),
                          issueSummaryRow(LocaleKeys.openingDate, issueProvider.issueSummaryDetail.idate.toString()),
                          issueSummaryRow(LocaleKeys.incallNumber, issueProvider.issueSummaryDetail.ani.toString()),
                          issueSummaryRow(
                              LocaleKeys.targetResponsed, TimeClass().timeRecover(issueProvider.issueSummaryDetail.targetRdate).toString()),
                          issueSummaryRow(LocaleKeys.targetFixed, TimeClass().timeRecover(issueProvider.issueSummaryDetail.targetFdate).toString()),
                          issueSummaryRow(LocaleKeys.hys, issueProvider.issueSummaryDetail.hys.toString()),
                          issueSummaryRow(LocaleKeys.hds, issueProvider.issueSummaryDetail.hds.toString()),
                          issueSummaryRow(LocaleKeys.assignmentGroup, issueProvider.issueSummaryDetail.assignmentgroupname.toString()),
                          issueSummaryRow(LocaleKeys.assigneName, issueProvider.issueSummaryDetail.assigneename.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
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
              child: Text(
                description ?? '-',
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
