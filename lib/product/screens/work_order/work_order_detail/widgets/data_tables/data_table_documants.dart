import 'package:flutter/material.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';
import '../../../../../../feature/models/work_order_models/work_order_attachments_model.dart';

class DataTableDocumants extends StatelessWidget {
  DataTableDocumants({super.key, required this.context, required this.data});

  final BuildContext context;
  final List<WorkOrderAttachmentsModel> data;

  final List<String> _labelList = ['İsim', 'Tip', 'Sil'];

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
              DataCell(Text(data[i].dispfilename.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].atchtype.toString(), style: _cellTextStyle())),
              DataCell(
                IconButton(
                  onPressed: () async {},
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
