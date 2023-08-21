import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../../../../../feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/effort_bottom_sheet.dart';

import '../../../../../../feature/constants/other/app_strings.dart';
import '../../provider/work_order_detail_accordion_provider.dart';
import '../data_tables/data_table_effort.dart';
import '../sub_accordion_section.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../base_accordion.dart';

class DocumantsAccordion extends StatelessWidget {
  const DocumantsAccordion({super.key, required this.workOrderCode});

  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return BaseAccordion(
      list: [
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addImage,
          AppIcons.camera,
          () => BaseBottomSheet.show(context, EffortBottomSheet()),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addPdf,
          AppIcons.pictureAsPdf,
          () => BaseBottomSheet.show(context, EffortBottomSheet()),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addedDocumants,
          AppIcons.documantScanner,
          () {
            context.read<WorkOrderDetailAccordionProvider>().update();
            context.read<WorkOrderDetailAccordionProvider>().setUserClickedEfforts();
          },
          Consumer<WorkOrderDetailAccordionProvider>(
            builder: (context, value, child) {
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
                  : DataTableEffort(context: context, data: context.read<WorkOrderDetailAccordionProvider>().loads);
            },
          ),
        ),
      ],
    );
  }
}
