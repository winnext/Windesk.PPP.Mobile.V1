import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_work_order_detail_card.dart';
import 'package:wm_ppp_4/feature/components/loading/custom_loading_indicator.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/provider/work_order_detail_provider_main.dart';

import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/constants/other/colors.dart';

@RoutePage()
class WorkOrderDetailScreen extends StatelessWidget {
  const WorkOrderDetailScreen({super.key, required this.workorderId});

  final String workorderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context, workorderId),
      body: ChangeNotifierProvider(
        create: (context) => WorkOrderDetailMainProvider(),
        child: Padding(
          padding: CustomPaddings.pageNormal,
          child: Consumer<WorkOrderDetailMainProvider>(
            builder: (context, value, child) {
              return value.initState ? _initBody(value) : _successBody(value);
            },
          ),
        ),
      ),
    );
  }

  Widget _successBody(WorkOrderDetailMainProvider value) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWorkOrderDetailCard(data: value.workOrderDetailsModel),
        ],
      ),
    );
  }

  Widget _initBody(WorkOrderDetailMainProvider value) {
    value.getWorkOrderDetail(workorderId);
    return const CustomLoadingIndicator();
  }

  CustomMainAppbar _appbar(BuildContext context, String workorderID) {
    return CustomMainAppbar(
      title: Text(workorderID, style: TextStyle(color: APPColors.Secondary.black, fontSize: 16)),
      returnBack: true,
      elevation: 4,
      popFunction: () {},
      actions: const [],
    );
  }
}
