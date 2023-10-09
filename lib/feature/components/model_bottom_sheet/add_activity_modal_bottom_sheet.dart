import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/issue_components/add_activity_issue.dart';
import 'package:wm_ppp_4/feature/components/issue_components/take_over_issue.dart';
import 'package:wm_ppp_4/feature/components/model_bottom_sheet/add_photo_modal_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_addphoto_provider.dart';

class IssueActionModal extends StatelessWidget {
  const IssueActionModal({super.key, required this.issueCode});
  final String issueCode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<IssueActionProvider>(create: (_) => IssueActionProvider()),
          ChangeNotifierProvider<IssueAddPhotoProvider>(create: (_) => IssueAddPhotoProvider()),
        ],
        child: Consumer2<IssueActionProvider, IssueAddPhotoProvider>(
          builder: (context, IssueActionProvider issueProvider, IssueAddPhotoProvider issueAddPhotoProvider, child) {
            if (issueAddPhotoProvider.isSuccess || issueProvider.isSuccessTakeOver) {
              snackBar(context, LocaleKeys.processDone, 'success');
              Navigator.of(context).pop();
            }
            if (issueAddPhotoProvider.errorAccur || issueProvider.errorAccur) {
              snackBar(context, LocaleKeys.processCancell, 'error');
              Navigator.of(context).pop();
            }
            issueProvider.isFetch ? null : issueProvider.getIssueOperations(issueCode);
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    issueProvider.issueOperationList.isPhoto == true
                        ? _operationWidget(
                            size, issueProvider, LocaleKeys.addPhoto, issueProvider.isPhotoSectionOpen, issueProvider.setisPhotoSectionOpen)
                        : Container(),
                    issueProvider.isPhotoSectionOpen ? addPhotoBottomSheet(context, size, issueAddPhotoProvider) : Container(),
                    issueProvider.issueOperationList.isActivity == true
                        ? _operationWidget(
                            size, issueProvider, LocaleKeys.addActivity, issueProvider.isActivitySectionOpen, issueProvider.setisActivitySectionOpen)
                        : Container(),
                        issueProvider.isActivitySectionOpen ? AddActivity(issueCode: issueCode,) : Container(),
              
                    issueProvider.issueOperationList.isChangeCfg == true
                        ? _operationWidget(size, issueProvider, LocaleKeys.changeCfg, issueProvider.isCfgSectionOpen, issueProvider.setisCfgSectionOpen)
                        : Container(),
                    issueProvider.issueOperationList.isTakeOver == true
                        ? _operationWidget(
                            size, issueProvider, LocaleKeys.takeOver, issueProvider.isTakeOverSectionOpen, issueProvider.setisTakeOverSectionOpen)
                        : Container(),                      
                    
                    issueProvider.isTakeOverSectionOpen
                        ? TakeOverIssue(
                            title: LocaleKeys.takeOver,
                            explanation: LocaleKeys.sureAboutTakeOverIssue,
                            onConfirm: () {
                              issueProvider.takeOverIssue(issueCode);
                            },
                            confirmButtonText: LocaleKeys.okay)
                        : Container(),
              
                    issueProvider.issueOperationList.isPlannedCancel == true
                        ? _operationWidget(size, issueProvider, LocaleKeys.plannedCancel, issueProvider.isPlannedCancelSectionOpen,
                            issueProvider.setisPlannedSectionOpen)
                        : Container(),
                    issueProvider.issueOperationList.isSparepart == true
                        ? _operationWidget(size, issueProvider, LocaleKeys.sparepartNeed, issueProvider.isSparepartSectionOpen,
                            issueProvider.setisSparepartSectionOpen)
                        : Container(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Container addPhotoBottomSheet(BuildContext context, Size size, IssueAddPhotoProvider issueAddPhotoProvider) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: APPColors.Main.white,
      width: size.width / 1.09,
      child: Column(
        children: [
          AddPhotoModalBottomSheet((File photoDile) {
            issueAddPhotoProvider.setFile(photoDile);
          }, (description) {
            issueAddPhotoProvider.setDesc(description);
          }, () {
            issueAddPhotoProvider.addImage(issueCode);
          }, LocaleKeys.addDescription),
        ],
      ),
    );
  }

  SizedBox _operationWidget(Size size, IssueActionProvider issueProvider, String actionNamebool, isOpen, Function openCloseFunction) {
    return SizedBox(
      width: size.width / 1.09,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: APPColors.Main.black, elevation: 10, backgroundColor: isOpen ? APPColors.Main.white : APPColors.Modal.blue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  actionNamebool,
                  style: TextStyle(
                    color: isOpen ? APPColors.Main.black : APPColors.Main.white,
                  ),
                ),
              ),
              Icon(
                isOpen ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
                color: isOpen ? APPColors.Main.black : APPColors.Main.white,
              )
            ],
          ),
          onPressed: () async {
            openCloseFunction(!isOpen);
          }),
    );
  }
}
