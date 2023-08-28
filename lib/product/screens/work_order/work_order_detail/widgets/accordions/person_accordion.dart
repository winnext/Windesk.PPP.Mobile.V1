import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import '../../../../../../feature/components/worker_order_bottom_sheets/personal_bottom_sheet.dart';
import '../data_tables/data_table_personals.dart';
import '../../../../../../feature/components/generic_bottom_sheet/base_bottom_sheet.dart';

import '../../../../../../feature/constants/other/app_strings.dart';
import '../../provider/work_order_detail_accordion_provider.dart';
import '../sub_accordion_section.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../base_accordion.dart';

class PersonAccordion extends StatelessWidget {
  const PersonAccordion({super.key, required this.workOrderCode});

  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return BaseAccordion(
      list: [
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addPersonal,
          AppIcons.add,
          () => BaseBottomSheet.show(context, PersonalBottomSheet(workOrderCode: workOrderCode, clearContext: context)),
          const SizedBox(height: 0),
        ),
        SubAccordionSection.subAccordion(
          context,
          AppStrings.addedPersonals,
          AppIcons.addPerson,
          () {
            context.read<WorkOrderDetailAccordionProvider>().update();
            context.read<WorkOrderDetailAccordionProvider>().setUserClickedPersonals();
          },
          Consumer<WorkOrderDetailAccordionProvider>(
            builder: (context, WorkOrderDetailAccordionProvider value, child) {
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  if (value.successDeleted && value.userCLickedPersonals) {
                    snackBar(context, AppStrings.personalDeleted, 'success');
                    context.read<WorkOrderDetailAccordionProvider>().clearPersonStates();
                  }
                  if (value.errorAccur && value.userCLickedPersonals) {
                    snackBar(context, AppStrings.deleteError, 'error');
                  }
                  context.read<WorkOrderDetailAccordionProvider>().userCLickedPersonals
                      ? context.read<WorkOrderDetailAccordionProvider>().fetchResourcesList(workOrderCode)
                      : null;
                },
              );
              return context.watch<WorkOrderDetailAccordionProvider>().isLoading
                  // show loading while fetching data
                  ? const Center(child: CircularProgressIndicator())
                  // show data table
                  : DataTablePersonsals(
                      context: context,
                      data: context.read<WorkOrderDetailAccordionProvider>().resources,
                      workOrderCode: workOrderCode,
                    );
            },
          ),
        ),
      ],
    );
  }
}
