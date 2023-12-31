import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/functions/invalid_device_id_check.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';

import '../../../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../../../feature/components/input_fields/text_fields_input_with_action_and_controller.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/style/custom_paddings.dart';
import '../provider/asset_search_provider.dart';

@RoutePage()
class AssetSearchPage extends StatelessWidget {
  const AssetSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    InvalidDeviceId().check(context);
    return ChangeNotifierProvider(
        create: (context) => AssetSearchProvider(),
        child: Consumer<AssetSearchProvider>(
            builder: (context, AssetSearchProvider assetSearchProvider, child) {
          return Scaffold(
            appBar: const CustomTabAppbar(
              title: AppStrings.entitiySearch,
              returnBack: true,
            ),
            body: Center(
              child: Padding(
                padding: CustomPaddings.pageNormal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldsInputWithActionAndController(
                        textController: assetSearchProvider.entityCode,
                        labelText: AppStrings.entitiyCode,
                        actionIcon: AppIcons.qr,
                        actionFunction: assetSearchProvider.scanEntityCode),
                    TextFieldsInputWithActionAndController(
                        textController: assetSearchProvider.serialNumber,
                        labelText: AppStrings.serialNumber,
                        actionIcon: AppIcons.qr,
                        actionFunction: assetSearchProvider.scanSerialNumber),
                    TextFieldsInputWithActionAndController(
                        textController: assetSearchProvider.rfidCode,
                        labelText: AppStrings.rfid,
                        actionIcon: AppIcons.qr,
                        actionFunction: assetSearchProvider.scanRfid),
                    TextFieldsInputWithActionAndController(
                        textController: assetSearchProvider.spaceCode,
                        labelText: AppStrings.space,
                        actionIcon: AppIcons.qr,
                        actionFunction: assetSearchProvider.scanSpace),
                    CustomHalfButtons(
                        leftTitle: const Text(
                          AppStrings.clean,
                          style: TextStyle(color: Colors.white),
                        ),
                        rightTitle: const Text(
                          AppStrings.search,
                          style: TextStyle(color: Colors.white),
                        ),
                        leftOnPressed: assetSearchProvider.clearInput,
                        rightOnPressed: () async {
                          if (assetSearchProvider.entityCode.text != '' ||
                              assetSearchProvider.serialNumber.text != '' ||
                              assetSearchProvider.rfidCode.text != '' ||
                              assetSearchProvider.spaceCode.text != '') {
                            await assetSearchProvider.getAssetSearchList(
                                context,
                                assetSearchProvider.entityCode.text,
                                assetSearchProvider.serialNumber.text,
                                assetSearchProvider.rfidCode.text,
                                '',
                                '',
                                '',
                                assetSearchProvider.spaceCode.text,
                                1);
                            // ignore: use_build_context_synchronously
                            context.router.push(AssetSearchListRoute(
                                assetSearchProviderx: assetSearchProvider));
                          } else {
                            snackBar(context, "Lütfen en az bir alan doldurun.",
                                'error');
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
