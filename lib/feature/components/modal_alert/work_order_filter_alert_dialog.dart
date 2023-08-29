import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import '../input_fields/underline_dropdown_input_fields.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';
import '../../../product/screens/work_order/provider/work_order_filter_list_provider.dart';

class WorkOrderFilterAlertDialog {
  static Future showAlertDialog(BuildContext context) {
    TextStyle titleStyle() => TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: APPColors.Main.white, letterSpacing: 0.6);
    TextStyle contentStyle() => TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: APPColors.Main.white, letterSpacing: 0.6);
    SizedBox emptyBox() => const SizedBox(height: 8);

    Column titleWidget() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.myResponsibles, style: titleStyle()),
            Divider(color: APPColors.Main.white, thickness: 1),
          ],
        );

    ElevatedButton button(Function onPress, String title, Color bgColor) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.circularBorderRadius),
          ),
          onPressed: () => onPress(),
          child: Text(title),
        );

    SizedBox filterTextField(Function onPressed) => SizedBox(
          height: 40,
          width: context.width * 0.35,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: CustomBorderRadius.textFieldBorderRadius),
              fillColor: APPColors.Main.white,
              filled: true,
            ),
            onChanged: (val) {},
          ),
        );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          backgroundColor: APPColors.Modal.blue,
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: titleWidget(),
          content: ChangeNotifierProvider(
            create: (context) => WorkOrderFilterListProvider(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnderlineDropdownInputFields(
                  labelText: AppStrings.state,
                  dropDownArray: const ['aa', 'bb', 'cc'],
                  onChangedFunction: (val) {},
                ),
                emptyBox(),
                UnderlineDropdownInputFields(
                  labelText: AppStrings.build,
                  dropDownArray: const ['aa', 'bb', 'cc'],
                  onChangedFunction: (val) {},
                ),
                emptyBox(),
                UnderlineDropdownInputFields(
                  labelText: AppStrings.floor,
                  dropDownArray: const ['aa', 'bb', 'cc'],
                  onChangedFunction: (val) {},
                ),
                emptyBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    filterTextField((val) {}),
                    const SizedBox(width: 10),
                    button(() {}, AppStrings.filter, APPColors.Login.blue),
                  ],
                ),
                emptyBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button(() {}, AppStrings.clean, APPColors.Main.blue),
                    button(() {}, AppStrings.filter, APPColors.Login.blue),
                  ],
                ),
              ],
            ),
          ),
          actions: const [],
        );
      },
    );
  }
}
