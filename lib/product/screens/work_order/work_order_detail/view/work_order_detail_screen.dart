import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/other/time_functions.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys_gsh.g.dart';
import '../widgets/accordions/documants_accordion.dart';
import '../widgets/accordions/materials_accordion.dart';
import '../widgets/accordions/person_accordion.dart';

import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_work_order_detail_card.dart';
import '../../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../../feature/constants/other/app_icons.dart';
import '../../../../../feature/constants/other/app_strings.dart';
import '../../../../../feature/constants/other/colors.dart';
import '../provider/work_order_detail_accordion_provider.dart';
import '../provider/work_order_detail_provider_main.dart';
import '../widgets/accordions/effort_accordion.dart';
import '../widgets/base_accordion.dart';
import '../widgets/work_order_detail_buttons.dart';

@RoutePage()
class WorkOrderDetailScreen extends StatelessWidget {
  const WorkOrderDetailScreen({super.key, required this.workorderCode});

  final String workorderCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context, workorderCode),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => WorkOrderDetailMainProvider()),
          ChangeNotifierProvider(
              create: (context) => WorkOrderDetailAccordionProvider()),
        ],
        child: Consumer<WorkOrderDetailMainProvider>(
          builder: (context, value, child) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              if (value.changedWorkOrderStatus) {
                snackBar(
                    context,
                    value.changeStateModel.message != null
                        ? value.changeStateModel.message!
                        : AppStrings.stateChanged,
                    'success');
              }
              workorderCode[0] == 'M'
                  ? (value.isFetchSummary
                      ? value.getIssueTimeInfo(
                          value.workOrderDetailsModel.modulecode)
                      : null)
                  : null;
            });
            return value.initState
                ? _initBody(value)
                : _successBody(context, value, workorderCode);
          },
        ),
      ),
    );
  }

  Widget _successBody(BuildContext context, WorkOrderDetailMainProvider value,
      String workOrderCode) {
    return RefreshIndicator(
      onRefresh: () async {
        value.getWorkOrderWithoutPermission(workOrderCode);
        context.read<WorkOrderDetailAccordionProvider>().setProvider();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            workorderCode[0] == 'M' ? _timeBar(value) : Container(),
            CustomWorkOrderDetailCard(data: value.workOrderDetailsModel),
            const SizedBox(height: 16),
            WorkOrderDetailButtons(
                value: value,
                workOrderCode: workorderCode,
                clearContext: context),
            const SizedBox(height: 32),
            !value.isStartEnable
                ? BaseAccordion(
                    list: [
                      _accordionSection(
                          AppStrings.efforts,
                          EffortAccordion(workOrderCode: workorderCode),
                          AppIcons.efforts),
                      _accordionSection(
                          AppStrings.materials,
                          MaterialAccordion(workOrderCode: workorderCode),
                          AppIcons.warehouse),
                      _accordionSection(
                          AppStrings.workers,
                          PersonAccordion(workOrderCode: workorderCode),
                          AppIcons.people),
                      _accordionSection(
                          AppStrings.documants,
                          DocumantsAccordion(workOrderCode: workorderCode),
                          AppIcons.documantScanner),
                      _accordionSection(
                          AppStrings.order, const SizedBox(), AppIcons.order),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Padding _timeBar(WorkOrderDetailMainProvider value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_responseWidget(value), _fixWidget(value)],
      ),
    );
  }

  Widget _initBody(WorkOrderDetailMainProvider value) {
    value.getWorkOrderDetail(workorderCode);
    return const CustomLoadingIndicator();
  }

  CustomMainAppbar _appbar(BuildContext context, String workorderID) {
    return CustomMainAppbar(
      title: Text(workorderID,
          style: TextStyle(color: APPColors.Secondary.black, fontSize: 16)),
      returnBack: true,
      elevation: 4,
      popFunction: () {
        Navigator.pop(context);
      },
      actions: const [],
    );
  }

  AccordionSection _accordionSection(
      String title, Widget content, IconData icon) {
    return AccordionSection(
      isOpen: false,
      headerBackgroundColor: APPColors.Accent.black,
      headerBackgroundColorOpened: APPColors.Accent.black,
      leftIcon: Icon(icon, color: APPColors.Main.white),
      contentBorderColor: APPColors.Accent.black,
      onOpenSection: () {},
      header: Text(title,
          style: TextStyle(color: APPColors.Main.white, letterSpacing: 1.5)),
      content: content,
    );
  }

  Column _responseWidget(WorkOrderDetailMainProvider woDetailProvider) {
    return Column(
      children: [
        woDetailProvider.issueSummaryTimeInfo.planneddate == LocaleKeys.oPlanned
            ? Container(
                decoration: BoxDecoration(
                    color: APPColors.NewNotifi.blue,
                    borderRadius: BorderRadius.circular(3)),
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(LocaleKeys.plannedIssue),
                    Text(woDetailProvider.issueSummaryTimeInfo.planneddate),
                  ],
                ),
              )
            : woDetailProvider.issueSummaryTimeInfo.respondedTimer ==
                    LocaleKeys.oneStr
                ? upTimeBar(
                    woDetailProvider,
                    LocaleKeys.targetResponsedDate,
                    woDetailProvider.issueSummaryTimeInfo.respondedTimer
                        .toString(),
                    woDetailProvider.issueSummaryTimeInfo.targetRdate
                        .toString(),
                    woDetailProvider.issueSummaryTimeInfo.respondedDate
                        .toString())
                : upTimeBar(
                    woDetailProvider,
                    LocaleKeys.responsedDate,
                    woDetailProvider.issueSummaryTimeInfo.respondedTimer
                        .toString(),
                    woDetailProvider.issueSummaryTimeInfo.respondedDate
                        .toString(),
                    woDetailProvider.issueSummaryTimeInfo.respondedDate
                        .toString())
      ],
    );
  }

  Column _fixWidget(WorkOrderDetailMainProvider woDetailProvider) {
    return Column(children: [
      woDetailProvider.issueSummaryTimeInfo.fixTimer == LocaleKeys.oneStr
          ? upTimeBar(
              woDetailProvider,
              LocaleKeys.targetFixedDate,
              woDetailProvider.issueSummaryTimeInfo.fixTimer.toString(),
              woDetailProvider.issueSummaryTimeInfo.targetFdate.toString(),
              woDetailProvider.issueSummaryTimeInfo.fixedDate.toString())
          : upTimeBar(
              woDetailProvider,
              LocaleKeys.fixedDate,
              woDetailProvider.issueSummaryTimeInfo.fixTimer.toString(),
              woDetailProvider.issueSummaryTimeInfo.fixedDate.toString(),
              woDetailProvider.issueSummaryTimeInfo.fixedDate.toString())
    ]);
  }

  Container upTimeBar(
    WorkOrderDetailMainProvider woDetailProvider,
    String title,
    String respondedTimer,
    String targetDate,
    String fixedDate,
  ) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title),
          targetDate == ''
              ? const Text('')
              : Text(
                  TimeClass().timeRecover(targetDate),
                  style: TimeClass()
                      .fixStyle(respondedTimer, targetDate, fixedDate),
                ),
        ],
      ),
    );
  }
}
