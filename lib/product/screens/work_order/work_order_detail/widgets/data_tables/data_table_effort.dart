import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/modal_alert/work_order_alert_dialog.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_loads_model.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_detail_accordion_provider.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';

class DataTableEffort extends StatelessWidget {
  DataTableEffort({super.key, required this.contextK, required this.data});

  final BuildContext contextK;
  final List<WorkOrderLoadsModel> data;

  final List<String> _labelList = ['İsim', 'Süre', 'Sil'];

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
              DataCell(Text(data[i].user.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].timeworked.toString(), style: _cellTextStyle())),
              DataCell(
                IconButton(
                  onPressed: () async {
                    await WorkOrderAlertDialog.showAlertDialog(context, AppStrings.deleteTitle, AppStrings.deleteEffort).then(
                      (value) => {
                        value ? contextK.read<WorkOrderDetailAccordionProvider>().deleteEffort(data[i].code.toString()) : null,
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
