import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../product/screens/work_order/provider/work_order_filter_list_provider.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';
import '../../models/work_order_models/work_order_filter_model.dart';
import '../input_fields/underline_dropdown_input_fields.dart';
import '../snackBar/snackbar.dart';

class WorkOrderFilterAlertDialog {
  static Future showAlertDialog(BuildContext context) {
    TextStyle titleStyle() => TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: APPColors.Main.white, letterSpacing: 0.6);
    TextStyle contentStyle() => TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: APPColors.Main.white, letterSpacing: 0.4);
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
              isDense: false,
              hintText: 'WO000000001',
              border: OutlineInputBorder(borderRadius: CustomBorderRadius.textFieldBorderRadius),
              fillColor: APPColors.Main.white,
              filled: true,
              contentPadding: const EdgeInsets.only(left: 4),
            ),
            onChanged: (val) => onPressed(val),
          ),
        );

    Container filterContainer(String name, Function clear) => Container(
          decoration: BoxDecoration(
            color: APPColors.Main.red,
            borderRadius: CustomBorderRadius.mediumBorderRadius,
          ),
          child: Row(
            children: [
              InkWell(child: const Icon(AppIcons.close, size: 24), onTap: () => clear()),
              const SizedBox(width: 5),
              Text(name, style: contentStyle()),
              const SizedBox(width: 8),
            ],
          ),
        );

    void initState(WorkOrderFilterListProvider val) => val.fetchInitValues();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: APPColors.Modal.blue,
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: titleWidget(),
          content: SingleChildScrollView(
            child: ChangeNotifierProvider(
              create: (context) => WorkOrderFilterListProvider(),
              child: Consumer(
                builder: (context, WorkOrderFilterListProvider val, child) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    initState(val);
                    if (val.errorAccurWhileSearching) {
                      snackBar(context, AppStrings.cantFound, 'error');
                    }
                  });

                  return val.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UnderlineDropdownInputFields(
                              labelText: AppStrings.state,
                              dropDownArray: val.status.map((e) => e.dispvalue ?? '').toList(),
                              onChangedFunction: val.setStatus,
                            ),
                            emptyBox(),
                            UnderlineDropdownInputFields(
                              labelText: AppStrings.build,
                              dropDownArray: val.buildings.map((e) => e.name ?? '').toList(),
                              onChangedFunction: val.setBuilding,
                            ),
                            emptyBox(),
                            UnderlineDropdownInputFields(
                              labelText: AppStrings.floor,
                              dropDownArray: val.floors.map((e) => e.name ?? '').toList(),
                              onChangedFunction: val.setFloor,
                            ),
                            emptyBox(),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  val.choosenStatus.isNotEmpty ? filterContainer(val.choosenStatus, val.clearStatus) : const SizedBox(),
                                  const SizedBox(width: 4),
                                  val.choosenBuilding.isNotEmpty ? filterContainer(val.choosenBuilding, val.clearBuilding) : const SizedBox(),
                                  const SizedBox(width: 4),
                                  val.choosenFloor.isNotEmpty ? filterContainer(val.choosenFloor, val.clearFloor) : const SizedBox(),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ),
                            emptyBox(),
                            emptyBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                filterTextField(val.setFilterTextField),
                                const SizedBox(width: 10),
                                button(
                                  () {
                                    val.searchWorkOrder(context);
                                  },
                                  AppStrings.search,
                                  APPColors.Login.blue,
                                ),
                              ],
                            ),
                            emptyBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                button(
                                  () {
                                    val.clearAll();
                                    context.router.pop<WorkOrderFilterModel>(
                                      WorkOrderFilterModel(state: '', building: '', floor: ''),
                                    );
                                  },
                                  AppStrings.clean,
                                  APPColors.Main.blue,
                                ),
                                button(
                                  () {
                                    context.router.pop<WorkOrderFilterModel>(
                                      WorkOrderFilterModel(
                                        stateName: val.choosenStatus,
                                        buildingName: val.choosenBuilding,
                                        floorName: val.choosenFloor,
                                        state: val.getChoosenStatusCode(),
                                        building: val.getChoosenBuildingCode(),
                                        floor: val.getChoosenFloorCode(),
                                      ),
                                    );
                                  },
                                  AppStrings.filter,
                                  APPColors.Login.blue,
                                ),
                              ],
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
          actions: const [],
        );
      },
    );
  }
}
