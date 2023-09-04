// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_workorder_list_card.dart';
import 'package:wm_ppp_4/feature/components/modal_alert/work_order_filter_alert_dialog.dart';
import 'package:wm_ppp_4/feature/constants/style/border_radius.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_filter_model.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';

import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../feature/constants/other/app_icons.dart';
import '../../../../feature/constants/other/colors.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';

@RoutePage()
class WorkOrderListScreen extends StatelessWidget {
  WorkOrderListScreen({super.key, required this.workOrderCode, required this.workOrderName});

  final String workOrderName;
  final String workOrderCode;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderListProvider(),
      child: Consumer<WorkOrderListProvider>(
        builder: (context, WorkOrderListProvider value, child) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            value.getWorkOrderList(workOrderCode);
          });
          return Scaffold(
            key: scaffoldKey,
            appBar: _appbar(context, value),
            body: value.isLoading ? const CustomLoadingIndicator() : _successBody(value, workOrderCode),
          );
        },
      ),
    );
  }

  CustomMainAppbar _appbar(BuildContext context, WorkOrderListProvider val) {
    return CustomMainAppbar(
      title: Text(workOrderName, style: TextStyle(color: APPColors.Secondary.black, fontSize: 16)),
      returnBack: true,
      elevation: 4,
      popFunction: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          context.read<WorkOrderListProvider>().closeTimer();
        });
      },
      actions: [
        IconButton(
          onPressed: () async {
            final response = await WorkOrderFilterAlertDialog.showAlertDialog(context);
            if (response != null && response is WorkOrderFilterModel) {
              if (response.searchNeed == true) {
                context.router.push(WorkOrderDetailScreen(workorderCode: response.workOrderCode ?? 'WOO0000001'));
              } else {
                val.setBuildingName(response.buildingName ?? '');
                val.setFloorName(response.floorName ?? '');
                val.setStatusName(response.stateName ?? '');
                val.setBuild(response.building ?? '');
                val.setStatus(response.state ?? '');
                val.setFloor(response.floor ?? '');
                val.getWorkOrderListWithoutPermission(workOrderCode);
              }
            }
          },
          icon: Icon(AppIcons.filter, color: APPColors.Secondary.black),
        ),
      ],
    );
  }

  Widget _successBody(WorkOrderListProvider value, String workOrderCode) {
    return Column(
      children: [
        const _TitleAndTimer(),
        value.statusName.isNotEmpty || value.buildingName.isNotEmpty || value.floorName.isNotEmpty
            ? Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        value.status.isNotEmpty ? filterContainer(value.statusName, value.clearStatus, workOrderCode) : const SizedBox(),
                        const SizedBox(width: 8),
                        value.build.isNotEmpty ? filterContainer(value.buildingName, value.clearBuild, workOrderCode) : const SizedBox(),
                        const SizedBox(width: 8),
                        value.floor.isNotEmpty ? filterContainer(value.floorName, value.clearFloor, workOrderCode) : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Expanded(
          flex: 84,
          child: ListView.builder(
            itemCount: value.workOrderListModel.length + 1,
            itemBuilder: (context, index) {
              if (index == value.workOrderListModel.length && value.isLastPage) return null;
              if (index == value.workOrderListModel.length) {
                value.getMoreOrderList(workOrderCode);
                return value.isLastPage ? const SizedBox() : const Center(child: CircularProgressIndicator());
              }
              final model = value.workOrderListModel[index];
              return InkWell(
                  onTap: () {
                    context.read<WorkOrderListProvider>().closeTimer();
                    context.router.push(WorkOrderDetailScreen(workorderCode: value.workOrderListModel[index].code ?? 'WOO0000001'));
                  },
                  child: CustomWorkorderListCard(model: model));
            },
          ),
        ),
      ],
    );
  }

  Container filterContainer(String name, Function clear, String workOrderCode) => Container(
        decoration: BoxDecoration(color: APPColors.Main.red, borderRadius: CustomBorderRadius.mediumBorderRadius),
        child: Row(
          children: [
            InkWell(child: const Icon(AppIcons.close, size: 24), onTap: () => clear(workOrderCode)),
            const SizedBox(width: 5),
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: APPColors.Main.white, letterSpacing: 0.4)),
            const SizedBox(width: 8),
          ],
        ),
      );
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
                  Text(context.read<WorkOrderListProvider>().title, style: TextStyle(color: APPColors.Secondary.white, letterSpacing: 1)),
                  Text(context.watch<WorkOrderListProvider>().currentTimeText, style: TextStyle(color: APPColors.Secondary.white, letterSpacing: 1)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
