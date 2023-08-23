import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_resources_model.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';

class DataTablePersonsals extends StatelessWidget {
  DataTablePersonsals({super.key, required this.context, required this.data});

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
                  onPressed: () {},
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
