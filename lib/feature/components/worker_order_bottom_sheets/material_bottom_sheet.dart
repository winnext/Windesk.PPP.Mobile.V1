import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../input_fields/text_fields_input.dart';
import '../snackBar/snackbar.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/style/custom_paddings.dart';
import '../../extensions/context_extension.dart';
import '../../../product/screens/work_order/work_order_detail/provider/work_order_detail_accordion_provider.dart';
import '../../../product/screens/work_order/work_order_detail/provider/work_order_material_sheet_provider.dart';

class MaterialBottomSheet extends StatelessWidget {
  const MaterialBottomSheet({super.key, required this.workOrderCode, required this.clearContext});

  final BuildContext clearContext;
  final String workOrderCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderMaterialSheetProvider(),
      child: Consumer<WorkOrderMaterialSheetProvider>(
        builder: (context, WorkOrderMaterialSheetProvider value, child) {
          if (value.errorAccur) {
            snackBar(context, AppStrings.materialAddedError, 'error');
          }
          if (value.materialSuccessfullyAdded) {
            snackBar(context, AppStrings.materialAdded, 'success');
            clearContext.read<WorkOrderDetailAccordionProvider>().clearMaterialStates();
            Navigator.of(context).pop();
          }
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
              padding: CustomPaddings.pageNormalVerticalX,
              child: Column(
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
                          onChangedFunction: (val) => value.setChoosenPackageInfo(val),
                          rightIcon: AppIcons.arrowDown,
                          dropDownArray: value.productPackageNames,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  value.showPackageInfo
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextFieldsInput(
                            onChangedFunction: (val) => value.setChoosenAmount(val),
                            labelText: AppStrings.enterProductAmount,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  value.showPackageInfo
                      ? CustomHalfButtons(
                          leftTitle: const Text(AppStrings.reject),
                          rightTitle: const Text(AppStrings.approve),
                          leftOnPressed: () => Navigator.of(context).pop(),
                          rightOnPressed: () => value.addMaterial(workOrderCode),
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
