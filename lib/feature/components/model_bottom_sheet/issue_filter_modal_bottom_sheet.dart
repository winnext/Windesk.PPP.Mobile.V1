import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_filter_bottom_sheet_provider.dart';
import '../buttons/custom_circular_with_text_button.dart';
import '../buttons/custom_elevated_button_with_icon.dart';
import '../../constants/other/colors.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class IssueFilterModalBottomSheet extends StatelessWidget {
  const IssueFilterModalBottomSheet({
    super.key,
    required this.stateList,
    required this.buildList,
    required this.floorList,
    required this.wingList,
    required this.selectStateFunction,
    required this.selectBuildFunction,
    required this.selectFloorFunction,
    required this.selectWingFunction,
    required this.filterStartFunction,
    required this.taskForMeFunction,
    required this.selectedParamList,
    required this.selectedParamListDeleteItem,
  });
  final List<String> stateList;
  final List<String> buildList;
  final List<String> floorList;
  final List<String> wingList;
  final Function selectStateFunction;
  final Function selectBuildFunction;
  final Function selectFloorFunction;
  final Function selectWingFunction;
  final Function filterStartFunction;
  final Function taskForMeFunction;
  final List<String> selectedParamList;
  final Function selectedParamListDeleteItem;

  @override
  Widget build(BuildContext context) {
    IssueFilterModalBottomSheetProvider provider = Provider.of<IssueFilterModalBottomSheetProvider>(context, listen: true);

    return _bodyWidget(context, provider);
  }

  _bodyWidget(BuildContext context, IssueFilterModalBottomSheetProvider provider) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _inputS(
              provider,
              context,
              stateList,
              buildList,
              floorList,
              wingList,
              selectStateFunction,
              selectBuildFunction,
              selectFloorFunction,
              selectWingFunction,
              taskForMeFunction,
            ),
            _selectedParamS(provider, selectedParamList, selectedParamListDeleteItem),
            _buttons(context, filterStartFunction),
          ],
        ),
      ),
    );
  }

  Expanded _inputS(
    IssueFilterModalBottomSheetProvider provider,
    context,
    stateList,
    buildList,
    floorList,
    wingList,
    selectStateFunction,
    selectBuildFunction,
    selectFloorFunction,
    selectWingFunction,
    taskForMeFunction,
  ) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomCircularWithTextButton(
                bgColor: APPColors.Login.blue,
                onPressFunction: taskForMeFunction,
                textButton: AppStrings.taskForMe,
                textColor: APPColors.Main.white,
              ),
            ),
          ),
          Expanded(
            child: DropDownInputFields(
              labelText: AppStrings.state,
              onChangedFunction: (String val) {
                selectStateFunction(val);
                provider.setChoosenStatus(val);
              },
              rightIcon: AppIcons.arrowDown,
              dropDownArray: stateList,
            ),
          ),
          Expanded(
            child: DropDownInputFields(
              labelText: AppStrings.build,
              onChangedFunction: (String val) {
                selectBuildFunction(val);
                provider.setChoosenBuilding(val);
              },
              rightIcon: AppIcons.arrowDown,
              dropDownArray: buildList,
            ),
          ),
          Expanded(
            child: DropDownInputFields(
              labelText: AppStrings.floor,
              onChangedFunction: (String val) {
                selectFloorFunction(val);
                provider.setChoosenFloor(val);
              },
              rightIcon: AppIcons.arrowDown,
              dropDownArray: floorList,
            ),
          ),
          Expanded(
            child: DropDownInputFields(
              labelText: AppStrings.wing,
              onChangedFunction: (String val) {
                selectWingFunction(val);
                provider.setChoosenWing(val);
              },
              rightIcon: AppIcons.arrowDown,
              dropDownArray: wingList,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _selectedParamS(IssueFilterModalBottomSheetProvider provider, selectedParamList, selectedParamListDeleteItem) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in provider.tempChoosenFilterList)
              i == ''
                  ? Container()
                  : Row(
                      children: [
                        CustomElevatedButtonWithIcon(
                          bgColor: APPColors.Main.white,
                          onPressFunction: (String x) {
                            selectedParamListDeleteItem(i);
                            provider.removeItemFromTempFilterList(i);
                          },
                          textValue: i,
                          textColor: APPColors.Main.black,
                          iconColor: APPColors.Main.red,
                          icon: Icons.clear,
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    )
          ],
        ),
      ),
    );
  }

  Expanded _buttons(context, Function filterStartFunction) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHalfButtons(
            leftTitle: const Text(AppStrings.cancel),
            rightTitle: const Text(AppStrings.save),
            leftOnPressed: () => Navigator.pop(context, false),
            rightOnPressed: () => Navigator.pop(context, true),
          )
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('saveEffort', filterStartFunction));
  }
}
