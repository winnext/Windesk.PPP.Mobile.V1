import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../snackBar/snackbar.dart';
import '../../../product/screens/work_order/work_order_detail/provider/work_order_detail_accordion_provider.dart';

import '../../../product/screens/work_order/work_order_detail/provider/work_order_image_sheet_provider.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/custom_paddings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input_underline.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({super.key, required this.workOrderCode, required this.clearContext});

  final String workOrderCode;
  final BuildContext clearContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      child: Padding(
        padding: CustomPaddings.pageHigh,
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderImageSheetProvider(),
          child: Consumer<WorkOrderImageSheetProvider>(
            builder: (context, WorkOrderImageSheetProvider value, child) {
              if (value.isSuccess) {
                snackBar(context, AppStrings.imageAdded, 'success');
                clearContext.read<WorkOrderDetailAccordionProvider>().clearDocumantStates();
                Navigator.of(context).pop();
              }
              if (value.errorAccur) {
                snackBar(context, AppStrings.imageAddedError, 'error');
              }
              return _body(context, value);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, WorkOrderImageSheetProvider value) {
    return value.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: context.height * 0.3,
                    decoration: BoxDecoration(shape: BoxShape.rectangle, color: APPColors.Main.grey),
                    child: value.image != null ? Image.file(value.image!) : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            backgroundColor: APPColors.Main.black,
                            child: const Icon(AppIcons.camera),
                            onPressed: () async {
                              await value.getImageFromCamera();
                            },
                          ),
                          const SizedBox(width: 12),
                          FloatingActionButton(
                            backgroundColor: APPColors.Main.black,
                            child: const Icon(AppIcons.galery),
                            onPressed: () async => await value.getImageFromGalery(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              TextFieldsInputUnderline(
                onChanged: value.setDesc,
                hintText: AppStrings.enterDescription,
              ),
              const SizedBox(height: 24),
              CustomHalfButtons(
                leftTitle: const Text(AppStrings.approve),
                rightTitle: const Text(AppStrings.approve),
                leftOnPressed: () => Navigator.of(context).pop(),
                rightOnPressed: () => value.addImage(workOrderCode),
              )
            ],
          );
  }
}
