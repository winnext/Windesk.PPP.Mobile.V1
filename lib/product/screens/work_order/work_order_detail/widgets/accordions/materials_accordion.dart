import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';

import '../../../../../../feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/material_bottom_sheet.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../provider/work_order_detail_accordion_provider.dart';
import '../base_accordion.dart';
import '../data_tables/data_table_materials.dart';
import '../sub_accordion_section.dart';

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
          () => BaseBottomSheet.show(context, MaterialBottomSheet(workOrderCode: workOrderCode, clearContext: context)),
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
              if (value.successDeleted) {
                snackBar(context, AppStrings.sparepartsDeleted, 'success');
                context.read<WorkOrderDetailAccordionProvider>().clearMaterialStates();
              }
              if (value.errorAccur) {
                snackBar(context, AppStrings.deleteError, 'error');
              }
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  context.read<WorkOrderDetailAccordionProvider>().userClickedMaterials
                      ? context.read<WorkOrderDetailAccordionProvider>().fetchMaterialList(workOrderCode)
                      : null;
                },
              );
              return context.watch<WorkOrderDetailAccordionProvider>().isLoading
                  // show loading while fetching data
                  ? const Center(child: CircularProgressIndicator())
                  // show data table
                  : DataTableMaterials(context: context, data: context.read<WorkOrderDetailAccordionProvider>().spareparts);
            },
          ),
        ),
      ],
    );
  }
}
