import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_action_provider.dart';

class IssueActionModal extends StatelessWidget {
  const IssueActionModal({super.key, required this.issueCode});
  final String issueCode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: ChangeNotifierProvider(
          create: (context) => IssueActionProvider(),
          child: Consumer<IssueActionProvider>(
            builder: (context, IssueActionProvider issueProvider, child) {
              issueProvider.isFetch ? null : issueProvider.getIssueOperations(issueCode);
              return Column(
                children: [
                  issueProvider.issueOperationList.isPhoto == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.addPhoto, issueProvider.isPhotoSectionOpen,issueProvider.setisPhotoSectionOpen)
                      : Container(),
                  issueProvider.issueOperationList.isActivity == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.addActivity, issueProvider.isActivitySectionOpen,issueProvider.setisActivitySectionOpen)
                      : Container(),
                  issueProvider.issueOperationList.isChangeCfg == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.changeCfg, issueProvider.isCfgSectionOpen,issueProvider.setisCfgSectionOpen)
                      : Container(),
                  issueProvider.issueOperationList.isTakeOver == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.takeOver, issueProvider.isTakeOverSectionOpen,issueProvider.setisTakeOverSectionOpen)
                      : Container(),
                  issueProvider.issueOperationList.isPlannedCancel == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.plannedCancel, issueProvider.isPlannedCancelSectionOpen,issueProvider.setisPlannedSectionOpen)
                      : Container(),
                  issueProvider.issueOperationList.isSparepart == true
                      ? _operationWidget(size, issueProvider,LocaleKeys.sparepartNeed, issueProvider.isSparepartSectionOpen,issueProvider.setisSparepartSectionOpen)
                      : Container(),
                ],
              );
            },
          )),
    );
  }

  SizedBox _operationWidget(Size size, IssueActionProvider issueProvider,String actionNamebool ,isOpen, Function openCloseFunction) {
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
