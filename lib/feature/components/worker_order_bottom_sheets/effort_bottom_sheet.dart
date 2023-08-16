// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_effort_sheet_provider.dart';

class EffortBottomSheet extends StatelessWidget {
  EffortBottomSheet({super.key});

  final List<String> _hourItems = ["15 dk", "30 dk", "45 dk", "1 sa", "2 sa", "6 sa", "Serbest Seçim"];
  final int _maxDay = 100;
  final int _maxHour = 24;
  final int _maxMinute = 59;
  final int _min = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderEffortSheetProvider(),
      child: Consumer<WorkOrderEffortSheetProvider>(
        builder: (context, value, child) => _body(context, value),
      ),
    );
  }

  SizedBox _body(BuildContext context, WorkOrderEffortSheetProvider value) {
    return SizedBox(
      height: value.choosenEffortType != _hourItems.last ? context.dynamicHeight(0.2) : context.dynamicHeight(0.4),
      child: Padding(
        padding: CustomPaddings.pageNormal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField(
              hint: const Text(AppStrings.choosenEffortDuration),
              items: _hourItems.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => value.onChangedChoosenEffortDuration(val != null ? val.toString() : ""),
            ),
            value.choosenEffortType == _hourItems.last ? const SizedBox(height: 20) : const SizedBox(),
            value.choosenEffortType != _hourItems.last
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _numberPickerTitle(
                        '${value.choosenEffortDay} ${AppStrings.day}',
                        NumberPicker(
                          minValue: _min,
                          maxValue: _maxDay,
                          value: value.choosenEffortDay,
                          onChanged: (val) => value.onChangedChoosenEffortDay(val),
                        ),
                      ),
                      _numberPickerTitle(
                        '${value.choosenEffortHour} ${AppStrings.hour}',
                        NumberPicker(
                          minValue: _min,
                          maxValue: _maxHour,
                          value: value.choosenEffortHour,
                          onChanged: (val) => value.onChangedChoosenEffortHour(val),
                        ),
                      ),
                      _numberPickerTitle(
                        '${value.choosenEffortMinute} ${AppStrings.minute}',
                        NumberPicker(
                          minValue: _min,
                          maxValue: _maxMinute,
                          value: value.choosenEffortMinute,
                          onChanged: (val) => value.onChangedChoosenEffortMinute(val),
                        ),
                      )
                    ],
                  ),
            const SizedBox(height: 25),
            CustomHalfButtons(
              leftTitle: const Text(AppStrings.reject),
              rightTitle: const Text(AppStrings.approve),
              leftOnPressed: () => Navigator.pop(context),
              rightOnPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Column _numberPickerTitle(String title, Widget numberPicker) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: APPColors.Main.black, fontSize: 14)),
        const SizedBox(height: 10),
        numberPicker,
      ],
    );
  }
}
