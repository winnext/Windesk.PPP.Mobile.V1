import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/image_bottom_sheet.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/pdf_bottom_sheet.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../provider/work_order_detail_accordion_provider.dart';
import '../base_accordion.dart';
import '../data_tables/data_table_effort.dart';
import '../sub_accordion_section.dart';

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
          () => BaseBottomSheet.show(context, const ImageBottomSheet()),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addPdf,
          AppIcons.pictureAsPdf,
          () => BaseBottomSheet.show(context, const PDFBottomSheet()),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addedDocumants,
          AppIcons.documantScanner,
          () {
            context.read<WorkOrderDetailAccordionProvider>().update();
            context.read<WorkOrderDetailAccordionProvider>().setUserClickedDocumants();
          },
          Consumer<WorkOrderDetailAccordionProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  context.read<WorkOrderDetailAccordionProvider>().userClickedDocumants
                      ? context.read<WorkOrderDetailAccordionProvider>().fetchDocumantsList(workOrderCode)
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
