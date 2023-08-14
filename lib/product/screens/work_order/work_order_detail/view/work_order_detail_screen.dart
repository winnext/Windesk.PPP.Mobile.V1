import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_work_order_detail_card.dart';
import '../../../../../feature/components/loading/custom_loading_indicator.dart';
import '../../../../../feature/constants/other/app_icons.dart';
import '../../../../../feature/constants/other/colors.dart';
import '../../../../../feature/constants/style/border_radius.dart';
import '../../../../../feature/constants/style/custom_paddings.dart';
import '../provider/work_order_detail_provider_main.dart';

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
          const SizedBox(height: 16),
          _WorkDetailButtons(value: value),
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

class _WorkDetailButtons extends StatelessWidget {
  const _WorkDetailButtons({required this.value});

  final WorkOrderDetailMainProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: CustomBorderRadius.circularBorderRadius, color: APPColors.Main.black),
          child: Icon(AppIcons.camera, color: APPColors.Main.white),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _elevatedButton(APPColors.Login.blue, 'Başlat', false),
            const SizedBox(width: 15),
            _elevatedButton(APPColors.Main.red, 'Bitir', true),
          ],
        )
      ],
    );
  }

  Widget _elevatedButton(Color color, String text, bool isActive) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          disabledBackgroundColor: APPColors.Main.black,
        ),
        onPressed: isActive ? () {} : null,
        child: Text(text, style: TextStyle(color: APPColors.Main.white, fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
