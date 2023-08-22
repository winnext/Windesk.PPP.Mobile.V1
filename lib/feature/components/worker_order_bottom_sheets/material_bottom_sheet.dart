import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_material_sheet_provider.dart';

class MaterialBottomSheet extends StatelessWidget {
  const MaterialBottomSheet({super.key, required this.workOrderCode});

  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderMaterialSheetProvider(),
      child: Consumer<WorkOrderMaterialSheetProvider>(
        builder: (context, WorkOrderMaterialSheetProvider value, child) {
          _init(value);
          return _body(context, value);
        },
      ),
    );
  }

  SizedBox _body(BuildContext context, WorkOrderMaterialSheetProvider value) {
    return SizedBox(
      height: context.height * 0.6,
      child: value.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: CustomPaddings.pageNormalX,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropDownInputFields(
                    labelText: AppStrings.pickStore,
                    onChangedFunction: (val) => value.getStoreProducts(val),
                    rightIcon: AppIcons.arrowDown,
                    dropDownArray: value.storeNames,
                  ),
                  const SizedBox(height: 20),
                  value.showProduct
                      ? DropDownInputFields(
                          labelText: AppStrings.pickProduct,
                          onChangedFunction: (val) => value.getStoreProductPackageInfos(val),
                          rightIcon: AppIcons.arrowDown,
                          dropDownArray: value.storeProductNames,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  value.showPackageInfo
                      ? DropDownInputFields(
                          labelText: AppStrings.pickProductAmount,
                          onChangedFunction: (val) {},
                          rightIcon: AppIcons.arrowDown,
                          dropDownArray: value.productPackageNames,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  value.showPackageInfo
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextFieldsInput(
                            onChangedFunction: (val) {},
                            labelText: AppStrings.enterProductAmount,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  value.showPackageInfo
                      ? CustomHalfButtons(
                          leftTitle: const Text(AppStrings.reject),
                          rightTitle: const Text(AppStrings.approve),
                          leftOnPressed: () {},
                          rightOnPressed: () {},
                        )
                      : const SizedBox()
                ],
              ),
            ),
    );
  }

  void _init(WorkOrderMaterialSheetProvider value) {
    value.initState();
  }
}
