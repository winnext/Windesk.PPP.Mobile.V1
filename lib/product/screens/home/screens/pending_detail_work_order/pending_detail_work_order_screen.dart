import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../../feature/components/cards/custom_undetail_pending_card.dart';
import '../../../../../feature/constants/other/app_strings.dart';
import '../../../../../feature/constants/style/custom_paddings.dart';
import 'pending_detail_work_order_provider.dart';

import '../../../../../feature/models/work_space/work_space_appendings.dart';

@RoutePage()
class PendingDetailWorkOrderScreen extends StatelessWidget {
  const PendingDetailWorkOrderScreen(
      {super.key, required this.workSpacePendiks});

  final WorkSpacePendiks workSpacePendiks;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PendingDetailWorkOrderProvider(),
      child: Consumer<PendingDetailWorkOrderProvider>(
        builder:
            (context, PendingDetailWorkOrderProvider provider, Widget? child) {
          return Scaffold(
            appBar: CustomMainAppbar(
                title: Text(workSpacePendiks.task?.name ?? ''), elevation: 4),
            body: Padding(
              padding: CustomPaddings.pageNormal,
              child: Column(
                children: [
                  CustomUndetailPendingCard(workSpacePendiks: workSpacePendiks),
                  const SizedBox(height: 20),
                  CustomHalfButtons(
                    leftTitle: const Text(AppStrings.reject),
                    rightTitle: const Text(AppStrings.approve),
                    leftOnPressed: () {},
                    rightOnPressed: () {},
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
