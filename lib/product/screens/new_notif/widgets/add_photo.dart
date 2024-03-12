import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings_gsh.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/product/screens/new_notif/provider/new_notif_provider.dart';

class AddPhotoSheet extends StatelessWidget {
  const AddPhotoSheet(
      {super.key,
      required this.workOrderCode,
      required this.clearContext,
      this.dontUseCleanFun});

  final String workOrderCode;
  final BuildContext clearContext;
  final bool? dontUseCleanFun;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      child: Padding(
        padding: CustomPaddings.pageHigh,
        child: ChangeNotifierProvider(
          create: (context) => NewNotifProvider(),
          child: Consumer<NewNotifProvider>(
            builder: (context, NewNotifProvider value, child) {
              // if (value.isSuccess) {
              //   snackBar(context, AppStrings.imageAdded, 'success');
              //   dontUseCleanFun != null
              //       ? dontUseCleanFun!
              //           ? null
              //           : clearContext
              //               .read<WorkOrderDetailAccordionProvider>()
              //               .clearDocumantStates()
              //       : clearContext
              //           .read<WorkOrderDetailAccordionProvider>()
              //           .clearDocumantStates();
              //   Navigator.of(context).pop();
              // }
              // if (value.errorAccur) {
              //   snackBar(context, AppStrings.imageAddedError, 'error');
              // }
              return _body(context, value);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, NewNotifProvider value) {
    return value.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: context.height * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: APPColors.Main.grey),
                    child:
                        value.image != null ? Image.file(value.image!) : null,
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              CustomHalfButtons(
                leftTitle: const Text(AppStrings.reject),
                rightTitle: const Text(AppStrings.approve),
                leftOnPressed: () => Navigator.of(context).pop(),
                rightOnPressed: () => value.addImage(workOrderCode),
              )
            ],
          );
  }
}
