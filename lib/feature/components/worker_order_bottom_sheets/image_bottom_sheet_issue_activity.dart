import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys_gsh.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import '../snackBar/snackbar.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/custom_paddings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input_underline.dart';

class ImageBottomSheetIssueActivity extends StatelessWidget {
  const ImageBottomSheetIssueActivity(
      {super.key, required this.issueCode, required this.spaceCode, required this.activityCode, required this.clearContext, this.dontUseCleanFun});

  final String issueCode;
  final bool spaceCode;
  final String activityCode;
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
              if (value.isSuccessEnterActivityForFixed) {
                Navigator.of(context).pop<bool>(true);
                snackBar(context, LocaleKeys.processDone, 'success');
              }
              if (value.errorAccurForFixed) {
                Navigator.of(context).pop<bool>(true);
                snackBar(context, value.errorMessage, 'error');
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
              spaceCode
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: TextFieldsInputWithActionAndController(
                          //readOnly: true,
                          textController: value.spaceCode,
                          labelText: LocaleKeys.spaceCode,
                          actionIcon: AppIcons.qr,
                          actionFunction: value.scanSpace),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldsInputUnderline(
                  onChanged: value.setDescription,
                  hintText: AppStrings.enterDescription,
                ),
              ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomHalfButtons(
                leftTitle: const Text(
                  LocaleKeys.cancel,
                  style: TextStyle(color: Colors.white),
                ),
                rightTitle: const Text(LocaleKeys.send, style: TextStyle(color: Colors.white)),
                leftOnPressed: () => Navigator.of(context).pop(),
                rightOnPressed: () => value.saveIssueActivityForFixed(issueCode, activityCode),
              )
            ],
          );
  }
}
