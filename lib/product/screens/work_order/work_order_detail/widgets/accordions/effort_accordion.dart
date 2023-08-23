import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import '../../../../../../feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/effort_bottom_sheet.dart';

import '../../../../../../feature/constants/other/app_strings.dart';
import '../../provider/work_order_detail_accordion_provider.dart';
import '../data_tables/data_table_effort.dart';
import '../sub_accordion_section.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../base_accordion.dart';

class EffortAccordion extends StatelessWidget {
  const EffortAccordion({super.key, required this.workOrderCode});

  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return BaseAccordion(
      list: [
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addEffort,
          AppIcons.add,
          () => BaseBottomSheet.show(context, EffortBottomSheet(workOrderCode: workOrderCode)),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addedEfforts,
          AppIcons.efforts,
          () {
            context.read<WorkOrderDetailAccordionProvider>().setUserClickedEfforts();
          },
          Consumer<WorkOrderDetailAccordionProvider>(
            builder: (contextK, value, child) {
              if (value.successDeleted) {
                snackBar(context, AppStrings.effortDeleted, 'success');
              }
              if (value.errorAccur) {
                snackBar(context, AppStrings.deleteError, 'error');
              }
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  context.read<WorkOrderDetailAccordionProvider>().userClickedEfforts
                      ? context.read<WorkOrderDetailAccordionProvider>().fetchEffortList(workOrderCode)
                      : null;
                },
              );
              return context.watch<WorkOrderDetailAccordionProvider>().isLoading
                  // show loading while fetching data
                  ? const Center(child: CircularProgressIndicator())
                  // show data table
                  : DataTableEffort(contextK: context, data: context.read<WorkOrderDetailAccordionProvider>().loads);
            },
          ),
        ),
      ],
    );
  }
}
