import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/worker_order_bottom_sheets/image_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';

class ChooseAddPhotoTypeSheet extends StatelessWidget {
  const ChooseAddPhotoTypeSheet({super.key, required this.workOrderCode});

  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          _alignedText(
            context,
            AppStrings.addImage,
            () {
              BaseBottomSheet.show(
                  context,
                  ImageBottomSheet(
                      workOrderCode: workOrderCode,
                      clearContext: context,
                      dontUseCleanFun: true));
            },
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  SizedBox _alignedText(BuildContext context, String title, Function fun) {
    return SizedBox(
      width: context.width,
      child: TextButton(
        onPressed: () => fun(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
