import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_workorder_list_card.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../feature/constants/other/colors.dart';
import '../../../../feature/extensions/context_extension.dart';

import '../../../../feature/constants/other/app_icons.dart';
import '../provider/work_order_list_provider.dart';

@RoutePage()
class WorkOrderListScreen extends StatelessWidget {
  const WorkOrderListScreen({super.key, required this.workOrderCode, required this.workOrderName});

  final String workOrderName;
  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderListProvider(),
      child: Scaffold(
        appBar: _appbar(context),
        body: Consumer<WorkOrderListProvider>(
          builder: (context, WorkOrderListProvider value, child) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              value.getWorkOrderList(workOrderCode);
            });
            return value.isLoading ? const CustomLoadingIndicator() : _successBody(value, workOrderCode);
          },
        ),
      ),
    );
  }

  CustomMainAppbar _appbar(BuildContext context) {
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
          onPressed: () {},
          icon: Icon(AppIcons.filter, color: APPColors.Secondary.black),
        ),
      ],
    );
  }

  Widget _successBody(WorkOrderListProvider value, String title) {
    return Column(
      children: [
        const _TitleAndTimer(),
        Expanded(
          flex: 92,
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
