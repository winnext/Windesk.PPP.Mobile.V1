import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';

import '../../../../../feature/constants/other/app_icons.dart';
import '../../../../../feature/constants/other/colors.dart';
import '../../../../../feature/constants/style/border_radius.dart';
import '../provider/work_order_detail_provider_main.dart';

class WorkOrderDetailButtons extends StatelessWidget {
  const WorkOrderDetailButtons({super.key, required this.value, required this.workOrderCode});

  final String workOrderCode;
  final WorkOrderDetailMainProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cameraButton(),
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
        )
      ],
    );
  }

  Container _cameraButton() {
    double size = 50;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(borderRadius: CustomBorderRadius.circularBorderRadius, color: APPColors.Main.black),
      child: Icon(AppIcons.camera, color: APPColors.Main.white),
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
