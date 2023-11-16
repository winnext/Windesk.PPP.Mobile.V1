import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/issue_filter_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_filter_bottom_sheet_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';
import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_issue_list_card.dart';
import '../../../../../feature/components/loading/custom_loading_indicator.dart';

import '../../../../../feature/models/issue_models/issue_list_model.dart';

@RoutePage()
class IssueListScreen extends StatelessWidget {
  const IssueListScreen(
      {super.key,
      required this.issueModuleCode,
      required this.issueModuleName});

  final String issueModuleCode;
  final String issueModuleName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => IssueProvider(),
        child: Consumer<IssueProvider>(
            builder: (context, IssueProvider issueProvider, child) {
          issueProvider.isFetch
              ? null
              : issueProvider.getIssueList(1, issueModuleCode);
          issueProvider.isFetchFilter ? null : issueProvider.getFilterValues();
          issueProvider.setIssueModuleCode(issueModuleCode);
          return Scaffold(
            appBar: CustomMainAppbar(
              title:
                  Text(issueModuleName, style: const TextStyle(color: Colors.black)),
              actions: [
                IconButton(
                  onPressed: () async {
                    IssueFilterModalBottomSheetProvider provider =
                        Provider.of<IssueFilterModalBottomSheetProvider>(
                            context,
                            listen: false);

                    final response = await showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => IssueFilterModalBottomSheet(
                        stateList: issueProvider.issueStatusNames.isEmpty
                            ? ['']
                            : issueProvider.issueStatusNames,
                        buildList: issueProvider.buildingFilterNames.isEmpty
                            ? ['']
                            : issueProvider.buildingFilterNames,
                        floorList: issueProvider.floorFilterNames.isEmpty
                            ? ['']
                            : issueProvider.floorFilterNames,
                        wingList: issueProvider.wingFilterNames.isEmpty
                            ? ['']
                            : issueProvider.wingFilterNames,
                        selectStateFunction: issueProvider.setstatusName,
                        selectBuildFunction: issueProvider.setbuildName,
                        selectFloorFunction: issueProvider.setfloorName,
                        selectWingFunction: issueProvider.setwingName,
                        filterStartFunction: () {
                          issueProvider.getIssueList(1, issueModuleCode);
                        },
                        taskForMeFunction: issueProvider.setassigne,
                        selectedParamList: const [],
                        selectedParamListDeleteItem: (item) {},
                      ),
                    );
                    if (response == true) {
                      provider.deleteServiceCodes(issueProvider);
                      provider.setChoosenFilterList();
                      issueProvider.getIssueList(1, issueModuleCode);
                    } else {
                      provider.clearList();
                    }
                  },
                  icon: Icon(AppIcons.filter, color: APPColors.Secondary.black),
                ),
              ],
              returnBack: true,
            ),
            body: issueProvider.loading
                ? const CustomLoadingIndicator()
                : Stack(children: [
                    const _TitleAndTimer(),
                    Padding(
                      padding: EdgeInsets.only(top: context.height * 0.04),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: issueProvider.notificationController,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            issueProvider.getIssueList(1, issueModuleCode);
                            context.read<IssueProvider>().setSecond();
                          },
                          strokeWidth: 4.0,
                          child: ListView.builder(
                              itemCount: issueProvider.issueList.length,
                              itemBuilder: (BuildContext context, int index) {
                                IssueListModel issueListElement =
                                    issueProvider.issueList[index];
                                return CustomIssueListCard(
                                    issueListElement: issueListElement,
                                    onPressed: (String woCode) {
                                      context.router.push(
                                          IssueDetailScreen(issueCode: woCode));
                                    },
                                    onPressedLong: () {});
                              }),
                        ),
                      ),
                    ),
                    issueProvider.loading
                        ? const CustomLoadingIndicator()
                        : const SizedBox()
                  ]),
          );
        }));
  }
}

class _TitleAndTimer extends StatelessWidget {
  const _TitleAndTimer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          Container(
            width: context.width,
            decoration: BoxDecoration(color: APPColors.Main.blue),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.read<IssueProvider>().title,
                      style: TextStyle(
                          color: APPColors.Secondary.white, letterSpacing: 1)),
                  Text(context.read<IssueProvider>().secondText.toString(),
                      style: TextStyle(
                          color: APPColors.Secondary.white, letterSpacing: 1)),
                  Text(context.watch<IssueProvider>().currentTimeText,
                      style: TextStyle(
                          color: APPColors.Secondary.white, letterSpacing: 1)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
