import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/worker_order_bottom_sheets/choose_add_document_type_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';

import '../../../../../feature/components/model_bottom_sheet/add_activity_modal_bottom_sheet.dart';
import '../../../../../feature/constants/other/app_icons.dart';
import '../../../../../feature/constants/other/colors.dart';
import '../../../../../feature/constants/style/border_radius.dart';
import '../provider/work_order_detail_provider_main.dart';

class WorkOrderDetailButtons extends StatelessWidget {
  const WorkOrderDetailButtons({super.key, required this.value, required this.workOrderCode, required this.clearContext});

  final String workOrderCode;
  final BuildContext clearContext;
  final WorkOrderDetailMainProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !value.isStartEnable ? _cameraButton(context) : const SizedBox(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _elevatedButton(
              APPColors.Login.blue,
              AppStrings.start,
              value.isStartEnable,
              () {
                value.changeWorkOrderStatus(workOrderCode, 'start');
              },
            ),
            const SizedBox(width: 15),
            _elevatedButton(
              APPColors.Main.red,
              AppStrings.end,
              value.isEndEnable,
              () {
                value.changeWorkOrderStatus(workOrderCode, 'end');
              },
            ),
          ],
        ),
        workOrderCode[0] == 'm' ? IssueActionModal(issueCode: value.workOrderDetailsModel.modulecode) : Container()
      ],
    );
  }

  Widget _cameraButton(BuildContext context) {
    double size = 50;
    return InkWell(
      onTap: () {
        BaseBottomSheet.show(context, ChooseAddDocumanyTypeSheet(workOrderCode: workOrderCode));
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(borderRadius: CustomBorderRadius.circularBorderRadius, color: APPColors.Main.black),
        child: Icon(AppIcons.camera, color: APPColors.Main.white),
      ),
    );
  }

  Widget _elevatedButton(Color color, String text, bool isActive, Function onPressed) {
    double size = 100;
    return SizedBox(
      width: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          disabledBackgroundColor: APPColors.Main.grey,
        ),
        onPressed: isActive ? () => onPressed() : null,
        child: Text(text, style: TextStyle(color: APPColors.Main.white, fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
