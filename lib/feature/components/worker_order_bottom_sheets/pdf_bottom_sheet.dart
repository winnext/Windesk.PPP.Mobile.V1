import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_with_icon_button.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_underline.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/paths/asset_paths.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_pdf_sheet_provider.dart';

class PDFBottomSheet extends StatelessWidget {
  const PDFBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.5,
      child: ChangeNotifierProvider(
        create: (context) => WorkOrderPdfSheetProvider(),
        child: Consumer<WorkOrderPdfSheetProvider>(
          builder: (context, WorkOrderPdfSheetProvider value, child) {
            return _body(context, value);
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, WorkOrderPdfSheetProvider value) {
    return Padding(
      padding: CustomPaddings.pageNormalX,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomCircularWithIconButton(
            bgColor: APPColors.Main.grey,
            icon: AppIcons.documantScanner,
            onPressFunction: () async => await value.getPDF(),
            iconColor: APPColors.Main.white,
          ),
          const SizedBox(height: 16),
          value.doc != null ? _showImage(value) : const SizedBox(),
          const SizedBox(height: 16),
          TextFieldsInputUnderline(hintText: AppStrings.enterDescription, onChanged: (val) {}),
          const SizedBox(height: 16),
          CustomHalfButtons(
            leftTitle: const Text(AppStrings.approve),
            rightTitle: const Text(AppStrings.reject),
            leftOnPressed: () => Navigator.of(context).pop(),
            rightOnPressed: () {},
          ),
        ],
      ),
    );
  }

  Column _showImage(WorkOrderPdfSheetProvider value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetPaths.pdf, height: 60, width: 50, fit: BoxFit.contain),
        const SizedBox(height: 5),
        Text(value.doc?.path.split('/').last ?? ''),
      ],
    );
  }
}
