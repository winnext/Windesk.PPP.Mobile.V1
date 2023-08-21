import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          return _body(context, value);
        },
      ),
    );
  }

  SizedBox _body(BuildContext context, WorkOrderMaterialSheetProvider value) {
    return SizedBox(
      height: context.height * 0.6,
      child: const Column(
        children: [],
      ),
    );
  }

  void _init(WorkOrderMaterialSheetProvider value) {
    value.getStores();
  }
}
