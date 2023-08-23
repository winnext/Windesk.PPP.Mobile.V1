import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/components/loading/custom_loading_indicator.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/product/screens/work_order/provider/work_order_provider.dart';

import '../../../../feature/components/cards/custom_tracing_list_card.dart';

@RoutePage()
class WorkOrderMainScreen extends StatelessWidget {
  const WorkOrderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomMainAppbar(title: Text(AppStrings.workOrderList, style: TextStyle(color: Colors.black)), elevation: 4, returnBack: true),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderProvider(),
      child: Consumer(builder: (context, WorkOrderProvider workOrderProvider, child) {
        workOrderProvider.getWorkOrderList();
        return workOrderProvider.isLoading ? const CustomLoadingIndicator() : _workOrderList(workOrderProvider);
      }),
    );
  }

  Widget _workOrderList(WorkOrderProvider provider) {
    return ListView.builder(
      itemCount: provider.workOrderTracingListModel.length,
      itemBuilder: (context, index) {
        return CustomTracingList(
          title: provider.workOrderTracingListModel[index].name.toString(),
          count: provider.workOrderTracingListModel[index].count.toString(),
          code: provider.workOrderTracingListModel[index].code.toString(),
          isWorkOrder: true,
        );
      },
    );
  }
}
