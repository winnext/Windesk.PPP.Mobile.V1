import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/issue_filter_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';
import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_issue_list_card.dart';
import '../../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../../feature/l10n/locale_keys.g.dart';

import '../../../../../feature/models/issue_models/issue_list_model.dart';

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
          issueProvider.isFetchFilter ? null : issueProvider.getFilterValues();
          return Scaffold(
            appBar: CustomMainAppbar(
              title: Text(
                LocaleKeys.issueList,
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => IssueFilterModalBottomSheet(
                        stateList: ['sd,asd'],
                        buildList: issueProvider.buildingFilterNames,
                        floorList: issueProvider.floorFilterNames,
                        wingList: issueProvider.wingFilterNames,
                        selectStateFunction: (String state) {},
                        selectBuildFunction: (build) {
                          issueProvider.setbuildName = build;
                        },
                        selectFloorFunction: (floor) {
                          issueProvider.setfloorName = floor;
                        },
                        selectWingFunction: (wing) {
                          issueProvider.setwingName = wing;
                        },
                        filterStartFunction: () {
                          issueProvider.getIssueList(1, issueModuleCode);
                        },
                        taskForMeFunction: () {},
                        selectedParamList: [issueProvider.buildName, issueProvider.floorName, issueProvider.wingName],
                        selectedParamListDeleteItem: (item) {
                          issueProvider.buildName == item.toString() ? issueProvider.setbuildName = '' : null;
                          issueProvider.getIssueList(1, issueModuleCode);
                        },
                      ),
                    );
                  },
                  icon: Icon(AppIcons.filter, color: APPColors.Secondary.black),
                ),
              ],
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
                          itemCount: issueProvider.issueList.length,
                          itemBuilder: (BuildContext context, int index) {
                            IssueListModel issueListElement = issueProvider.issueList[index];
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
                                onPressed: (String woCode) {
                                  context.router.push(IssueDetailScreen(issueCode: woCode));
                                },
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
