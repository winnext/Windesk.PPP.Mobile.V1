import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys_gsh.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import '../snackBar/snackbar.dart';
import '../../../product/screens/work_order/work_order_detail/provider/work_order_detail_accordion_provider.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/custom_paddings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input_underline.dart';

class ImageBottomSheetIssueActivity extends StatelessWidget {
  const ImageBottomSheetIssueActivity({super.key, required this.issueCode, required this.clearContext, this.dontUseCleanFun});

  final String issueCode;
  final BuildContext clearContext;
  final bool? dontUseCleanFun;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      child: Padding(
        padding: CustomPaddings.pageHigh,
        child: ChangeNotifierProvider(
          create: (context) => IssueActionProvider(),
          child: Consumer<IssueActionProvider>(
            builder: (context, IssueActionProvider value, child) {
              if (value.isSuccessEnterActivity) {
                snackBar(context, LocaleKeys.processDone, 'success');
                dontUseCleanFun != null
                    ? dontUseCleanFun!
                        ? null
                        : clearContext.read<WorkOrderDetailAccordionProvider>().clearDocumantStates()
                    : clearContext.read<WorkOrderDetailAccordionProvider>().clearDocumantStates();
              Navigator.of(context).pop<bool>(true);
              }
              if (value.errorAccur) {
                snackBar(context, LocaleKeys.processCancell, 'error');
              }
              return _body(context, value);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, IssueActionProvider value) {
    return value.loading
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
                onChanged: value.setDescription,
                hintText: AppStrings.enterDescription,
              ),
              const SizedBox(height: 24),
              CustomHalfButtons(
                leftTitle: const Text(LocaleKeys.cancel,style: TextStyle(color:Colors.white),),
                rightTitle: const Text(LocaleKeys.addActivity,style: TextStyle(color:Colors.white)),
                leftOnPressed: () => Navigator.of(context).pop(),
                rightOnPressed: () => value.saveIssueActivity(issueCode),
              )
            ],
          );
  }
}
