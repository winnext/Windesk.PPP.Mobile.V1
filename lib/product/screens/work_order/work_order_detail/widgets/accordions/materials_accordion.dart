import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/worker_order_bottom_sheets/material_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_detail_accordion_provider.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/widgets/base_accordion.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/widgets/data_tables/data_table_effort.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/widgets/sub_accordion_section.dart';

class MaterialAccordion extends StatelessWidget {
  const MaterialAccordion({super.key, required this.workOrderCode});
  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return BaseAccordion(
      list: [
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addMaterial,
          AppIcons.add,
          () => BaseBottomSheet.show(context, MaterialBottomSheet(workOrderCode: workOrderCode)),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addedMaterials,
          AppIcons.addMaterial,
          () {
            context.read<WorkOrderDetailAccordionProvider>().update();
            context.read<WorkOrderDetailAccordionProvider>().setUserClickedMaterials();
          },
          Consumer<WorkOrderDetailAccordionProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  context.read<WorkOrderDetailAccordionProvider>().userClickedEfforts
                      ? null
                      // ? context.read<WorkOrderDetailAccordionProvider>().fetchEffortList(workOrderCode)
                      : null;
                },
              );
              return context.watch<WorkOrderDetailAccordionProvider>().isLoading
                  // show loading while fetching data
                  ? const Center(child: CircularProgressIndicator())
                  // show data table
                  : DataTableEffort(context: context, data: context.read<WorkOrderDetailAccordionProvider>().loads);
            },
          ),
        ),
      ],
    );
  }
}
