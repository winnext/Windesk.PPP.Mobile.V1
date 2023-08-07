import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/product/screens/work_order/provider/work_order_provider.dart';

@RoutePage()
class WorkOrderScreen extends StatelessWidget {
  const WorkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomMainAppbar(title: Text(AppStrings.workOrderList, style: TextStyle(color: Colors.black)), elevation: 4, returnBack: true),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderProvider(),
      child: Consumer(builder: (context, WorkOrderProvider workOrderProvider, child) {
        workOrderProvider.getWorkOrderList();
        return const SizedBox();
      }),
    );
  }
}
