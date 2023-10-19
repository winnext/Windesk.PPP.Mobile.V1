import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/add_just_photo_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/functions/null_check_widget.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

// ignore: must_be_immutable
class AddActivity extends StatelessWidget {
  const AddActivity({super.key, required this.issueCode});
  final String issueCode;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IssueActionProvider>.value(value: IssueActionProvider()),
        ChangeNotifierProvider<IssueProvider>.value(value: IssueProvider()),
      ],
      child: Consumer2<IssueActionProvider, IssueProvider>(
        builder: (context, IssueActionProvider issueActionProvider, IssueProvider issueProvider, child) {
          issueActionProvider.isFetchActivity ? issueActionProvider.getAvailableActivities(issueCode) : null;
          issueActionProvider.isassigneeccType ? issueActionProvider.getLiveSelectAsgGroupsFunc(issueCode) : null;
          if (issueActionProvider.isSuccessEnterActivity) {
            snackBar(context, LocaleKeys.processDone, 'success');
            Navigator.of(context).pop<bool>(true);
          }
          if (issueActionProvider.errorAccur) {
            snackBar(context, LocaleKeys.processCancell, 'error');
            Navigator.of(context).pop<bool>(false);
          }
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width / 1.09,
            color: APPColors.Main.white,
            child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          DropDownInputFields(
                            labelText: LocaleKeys.selectActivity,
                            onChangedFunction: (item) {
                              issueActionProvider.setSelectedActivityName(item.toString());
                            },
                            rightIcon: Icons.arrow_drop_down,
                            dropDownArray: issueActionProvider.availableActivitiesName.isNotEmpty ?  issueActionProvider.availableActivitiesName : ['Aktivite bulunamadı.'],
                          ),
                          const Divider(thickness: 2),
                          Text('Bu aktivitenin girilmesi, talebin durumunu ${issueActionProvider.selectedActivityName} olarak değiştirecektir.'),
                          NullCheckWidget().conditionCheckWidget(
                              issueActionProvider.isBarcodeSpace,
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFieldsInputWithActionAndController(
                                    readOnly: true,
                                    textController: issueActionProvider.spaceCode,
                                    labelText: LocaleKeys.spaceCode,
                                    actionIcon: AppIcons.qr,
                                    actionFunction: issueActionProvider.scanSpace),
                              )),
                          NullCheckWidget().conditionCheckWidget(
                            issueActionProvider.isadditionaltimeInput,
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextFieldsInput(
                                labelText: LocaleKeys.addMoreTime,
                                onChangedFunction: (String time) {
                                  issueActionProvider.setadditionaltimeInput(time);
                                },
                              ),
                            ),
                          ),
                          //   //live select
                          NullCheckWidget().conditionCheckWidget(
                              issueActionProvider.getLiveSelectAsgGroupsName.isNotEmpty,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropDownInputFields(
                                  labelText: LocaleKeys.selectGroup,
                                  onChangedFunction: (item) {
                                    issueActionProvider.setSelectedAsgGroups(issueCode, item.toString());
                                  },
                                  rightIcon: Icons.arrow_drop_down,
                                  dropDownArray: issueActionProvider.getLiveSelectAsgGroupsName,
                                ),
                              )),
                          NullCheckWidget().conditionCheckWidget(
                              issueActionProvider.getLiveSelectAsgGroupsName.isNotEmpty,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropDownInputFields(
                                  labelText: LocaleKeys.selectUser,
                                  onChangedFunction: (item) {
                                    issueActionProvider.setSelectedAsgUser(item.toString());
                                  },
                                  rightIcon: Icons.arrow_drop_down,
                                  dropDownArray:
                                      issueActionProvider.getLiveSelectAsgUsersName.isNotEmpty ? issueActionProvider.getLiveSelectAsgUsersName : [''],
                                ),
                              )),
                          NullCheckWidget().conditionCheckWidget(
                              issueActionProvider.minDescLength,
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFieldsInput(
                                  labelText: LocaleKeys.description,
                                  onChangedFunction: (String text) {
                                    issueActionProvider.setdescription(text);
                                  },
                                ),
                              )),
                          NullCheckWidget().conditionCheckWidget(issueActionProvider.mobilePhoto, AddJustPhotoModalBottomSheet((File path) {
                            issueActionProvider.setFile(path);
                          })),
                          _saveOrQuit(context, issueActionProvider, issueProvider)
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Padding _saveOrQuit(BuildContext context, IssueActionProvider issueActionProvider, IssueProvider issueProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomHalfButtons(
          leftTitle: const Text(
            AppStrings.cancel,
            style: TextStyle(color: Colors.white),
          ),
          rightTitle: const Text(AppStrings.save, style: TextStyle(color: Colors.white)),
          leftOnPressed: () {
            Navigator.pop(context);
          },
          rightOnPressed: () async {
            issueActionProvider.saveIssueActivity(issueCode, issueProvider);
          }),
    );
  }
}