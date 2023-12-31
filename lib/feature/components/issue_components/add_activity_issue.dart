import 'package:flutter/material.dart';
import 'package:freeze/freeze.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/components/worker_order_bottom_sheets/image_bottom_sheet_issue_activity.dart';
import 'package:wm_ppp_4/feature/constants/functions/null_check_widget.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/provider/issue_search_provider.dart';

// ignore: must_be_immutable
class AddActivity extends StatelessWidget {
  const AddActivity({super.key, required this.issueCode});
  final String issueCode;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IssueActionProvider>.value(
            value: IssueActionProvider()),
        ChangeNotifierProvider<IssueProvider>.value(value: IssueProvider()),
        ChangeNotifierProvider<IssueSearchProvider>.value(
            value: IssueSearchProvider()),
      ],
      child: Consumer3<IssueActionProvider, IssueProvider, IssueSearchProvider>(
        builder: (context,
            IssueActionProvider issueActionProvider,
            IssueProvider issueProvider,
            IssueSearchProvider issueSearchProvider,
            child) {
          issueActionProvider.isFetchActivity &&
                  issueActionProvider.image == null
              ? issueActionProvider.getAvailableActivities(issueCode)
              : null;
          issueActionProvider.isassigneeccType
              ? issueActionProvider.getLiveSelectAsgGroupsFunc(issueCode)
              : null;
          if (issueActionProvider.isSuccessEnterActivity) {
            snackBar(context, LocaleKeys.processDone, 'success');
            print('SUCCESS ADD ACTIVITY');
            issueSearchProvider.setIssueUpdateData = true;
            print(issueSearchProvider.issueUpdateData);
            // Navigator.of(context).pop<bool>(true);
            Navigator.pop(context, true);
          }
          if (issueActionProvider.errorAccur) {
            snackBar(
                context,
                issueActionProvider.errorMessage != ''
                    ? issueActionProvider.errorMessage
                    : LocaleKeys.processCancell,
                'error');
            Navigator.of(context).pop<bool>(false);
          }
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width / 1.09,
            color: APPColors.Main.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    DropDownInputFields(
                      labelText: LocaleKeys.selectActivity,
                      onChangedFunction: (item) {
                        issueActionProvider
                            .setSelectedActivityName(item.toString());
                      },
                      rightIcon: Icons.arrow_drop_down,
                      dropDownArray:
                          issueActionProvider.availableActivitiesName.isNotEmpty
                              ? issueActionProvider.availableActivitiesName
                              : ['Aktivite bulunamadı.'],
                    ),
                    const Divider(thickness: 2),
                    issueActionProvider.selectedActivityName != 'Seçiniz'
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            child: Column(
                              children: [
                                Text(
                                    'Talebin durumunu ${issueActionProvider.selectedActivityNextStateName} olarak değişecektir.'),
                                NullCheckWidget().conditionCheckWidget(
                                    issueActionProvider.isBarcodeSpace,
                                    !issueActionProvider.mobilePhoto
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child:
                                                TextFieldsInputWithActionAndController(
                                                    //readOnly: true,
                                                    textController:
                                                        issueActionProvider
                                                            .spaceCode,
                                                    labelText:
                                                        LocaleKeys.spaceCode,
                                                    actionIcon: AppIcons.qr,
                                                    actionFunction:
                                                        issueActionProvider
                                                            .scanSpace),
                                          )
                                        : Container()),
                                NullCheckWidget().conditionCheckWidget(
                                  issueActionProvider.isadditionaltimeInput,
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextFieldsInput(
                                      labelText: LocaleKeys.addMoreTime,
                                      onChangedFunction: (String time) {
                                        issueActionProvider
                                            .setadditionaltimeInput(time);
                                      },
                                    ),
                                  ),
                                ),
                                //   //live select
                                NullCheckWidget().conditionCheckWidget(
                                    issueActionProvider
                                        .getLiveSelectAsgGroupsName.isNotEmpty,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropDownInputFields(
                                        labelText: LocaleKeys.selectGroup,
                                        onChangedFunction: (item) {
                                          issueActionProvider
                                              .setSelectedAsgGroups(
                                                  issueCode, item.toString());
                                        },
                                        rightIcon: Icons.arrow_drop_down,
                                        dropDownArray: issueActionProvider
                                            .getLiveSelectAsgGroupsName,
                                      ),
                                    )),
                                NullCheckWidget().conditionCheckWidget(
                                    issueActionProvider
                                        .getLiveSelectAsgGroupsName.isNotEmpty,
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: issueActionProvider
                                                    .selectedAsgGroupName !=
                                                LocaleKeys.selectGroup
                                            ? DropDownInputFields(
                                                labelText:
                                                    LocaleKeys.selectUser,
                                                onChangedFunction: (item) {
                                                  issueActionProvider
                                                      .setSelectedAsgUser(
                                                          item.toString());
                                                },
                                                rightIcon:
                                                    Icons.arrow_drop_down,
                                                dropDownArray: issueActionProvider
                                                        .getLiveSelectAsgUsersName
                                                        .isNotEmpty
                                                    ? issueActionProvider
                                                        .getLiveSelectAsgUsersName
                                                    : ['Kullanıcı Seçiniz'],
                                              )
                                            : null)),
                                NullCheckWidget().conditionCheckWidget(
                                  !issueActionProvider.mobilePhoto,
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextFieldsInput(
                                      labelText: LocaleKeys.description,
                                      onChangedFunction: (String text) {
                                        issueActionProvider
                                            .setdescription(text);
                                      },
                                    ),
                                  ),
                                ),
                                NullCheckWidget().conditionCheckWidget(
                                  issueActionProvider.mobilePhoto,
                                  ImageBottomSheetIssueActivity(
                                    issueCode: issueCode,
                                    activityCode: issueActionProvider
                                        .selectedActivityCode,
                                    spaceCode:
                                        issueActionProvider.isBarcodeSpace,
                                    clearContext: context,
                                  ),
                                ),
                                NullCheckWidget().conditionCheckWidget(
                                  !issueActionProvider.mobilePhoto,
                                  _saveOrQuit(context, issueActionProvider,
                                      issueProvider),
                                ),
                              ],
                            ),
                          )
                        : const Text(
                            'İşlem yapabilmek için lütfen aktivite seçiniz.')
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _saveOrQuit(BuildContext context,
      IssueActionProvider issueActionProvider, IssueProvider issueProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomHalfButtons(
          leftTitle: const Text(
            AppStrings.cancel,
            style: TextStyle(color: Colors.white),
          ),
          rightTitle: const Text(AppStrings.save,
              style: TextStyle(color: Colors.white)),
          leftOnPressed: () {
            Navigator.pop(context);
          },
          rightOnPressed: () {
            if (issueActionProvider.minDescLength == true) {
              issueActionProvider.description.length >= 20
                  ? issueActionProvider.saveIssueActivity(issueCode)
                  : snackBar(context, LocaleKeys.descriptionLength, 'error');
            } else {
              issueActionProvider.saveIssueActivity(issueCode);
            }
          }),
    );
  }
}
