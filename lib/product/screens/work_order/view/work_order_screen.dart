import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';

@RoutePage()
class WorkOrderScreen extends StatelessWidget {
  const WorkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomMainAppbar(
        title: Text(
          AppStrings.workOrderList,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 4,
        returnBack: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
