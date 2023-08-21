import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_person_sheet_provider.dart';

class PersonalBottomSheet extends StatelessWidget {
  const PersonalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      child: Padding(
        padding: CustomPaddings.pageNormal,
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderPersonSheetProvider(),
          child: Consumer<WorkOrderPersonSheetProvider>(
            builder: (context, WorkOrderPersonSheetProvider value, child) {
              _init(value);
              return _body(value);
            },
          ),
        ),
      ),
    );
  }

  void _init(WorkOrderPersonSheetProvider value) {
    value.getInfos();
  }

  Widget _body(WorkOrderPersonSheetProvider value) {
    return value.init
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              DropDownInputFields(
                labelText: AppStrings.choosePersonal,
                onChangedFunction: (val) {},
                rightIcon: AppIcons.arrowDown,
                dropDownArray: value.addedResources.map((e) => e.fullname ?? "").toList(),
              ),
              const SizedBox(height: 25),
              DropDownInputFields(
                labelText: AppStrings.chooseShift,
                onChangedFunction: (val) {},
                rightIcon: AppIcons.arrowDown,
                dropDownArray: value.shiftings.map((e) => e.name ?? '').toList(),
              ),
              const SizedBox(height: 25),
              CustomHalfButtons(
                leftTitle: const Text(AppStrings.approve),
                rightTitle: const Text(AppStrings.reject),
                leftOnPressed: () {},
                rightOnPressed: () {},
              ),
              const SizedBox(height: 25),
            ],
          );
  }
}
