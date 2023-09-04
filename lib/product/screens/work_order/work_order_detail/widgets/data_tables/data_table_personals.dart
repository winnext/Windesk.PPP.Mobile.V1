import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../feature/components/modal_alert/work_order_alert_dialog.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/models/work_order_models/work_order_resources_model.dart';
import '../../provider/work_order_detail_accordion_provider.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';

class DataTablePersonsals extends StatelessWidget {
  DataTablePersonsals({super.key, required this.context, required this.data, required this.workOrderCode});

  final String workOrderCode;
  final BuildContext context;
  final List<WorkOrderResourcesModel> data;

  final List<String> _labelList = ['İsim', 'Periyod', 'Sil'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 1,
        showBottomBorder: true,
        horizontalMargin: 0,
        columns: [
          for (var i = 0; i < _labelList.length; i++) ...{
            DataColumn(
              label: Text(
                _labelList[i],
                style: _cellTextStyle(),
              ),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < (data.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].name.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].vardiya.toString(), style: _cellTextStyle())),
              DataCell(
                IconButton(
                  onPressed: () async {
                    await WorkOrderAlertDialog.showAlertDialog(context, AppStrings.deleteTitle, '${data[i].modulecode} ${AppStrings.deleteResources}')
                        .then(
                      (value) => {
                        value ? context.read<WorkOrderDetailAccordionProvider>().deleteResource(data[i].modulecode.toString(), workOrderCode) : null,
                        context.read<WorkOrderDetailAccordionProvider>().update(),
                      },
                    );
                  },
                  icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                ),
              ),
            ]),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle() {
    return const TextStyle(color: Colors.black);
  }
}
