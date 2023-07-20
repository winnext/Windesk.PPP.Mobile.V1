import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_tab_appbar.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../test_provider.dart';

@RoutePage()
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final RoundedLoadingButtonController _controllerButton =
      RoundedLoadingButtonController();

  Function get test => test;

  String get testv1 => "success";
  String get testv2 => "success";

  connectionTest() async {
    _controllerButton.success();
    TestProvider().accessTestV1Function();

    TestProvider().accessTestV2Function();

    _controllerButton.reset();
    // Timer(Duration(seconds: 1), () {
    //   TestProvider().accessTestFunction();
    //   controllerButton.success();
    //   _controllerButton.reset();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestProvider(),
      child: Consumer<TestProvider>(
          builder: (context, TestProvider testProvider, child) {
        return Scaffold(
          appBar: const CustomTabAppbar(title: AppStrings.testTab),
          body: Center(child: _bodyWidget(context)),
        );
      }),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _headerWidget(context),
        _infoWidget(context),
        _buttonsAndTestResultWidget(context),
      ],
    );
  }

  _headerWidget(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Windesk Destek',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Kullanıcı Kodu : sgnm1001'),
          ],
        ),
      ),
    );
  }

  _infoWidget(BuildContext context) {
    return const Expanded(
      flex: 5,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ServiceTools.facilityName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cihaz : ' + 'iphone'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('OS : ' + 'IOS'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Uygulama Versiyonu : 1.0.0'),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Bağlantı Zamanı',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Sunucu Saati : sunucu saati'),
                  Text('Telefon Saati : tarih'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buttonsAndTestResultWidget(
    BuildContext context,
  ) {
    print(context.read<TestProvider>().accessTestV2);
    return Expanded(
      flex: 6,
      child: Column(
        children: [
          // buttonNotify(context, AppStrings.issueNotify, onPressFunction,
          //     _controllerButton),
          buttonTest(context, AppStrings.accessTest, connectionTest,
              _controllerButton),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: context.read<TestProvider>().accessTestV2 == 'true'
                      ? const Text(
                          'Windesk : Erişim Başarılı',
                          style: TextStyle(color: Colors.green),
                        )
                      : testv1 == 'false'
                          ? const Text(
                              'Windesk: Erişim Başarısız',
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text(
                              'Windesk: Erişim Bekleniyor...',
                              style: TextStyle(color: Colors.orange),
                            ),
                ),
                Container(
                  child: context.read<TestProvider>().accessTestV2 == 'true'
                      ? const Text(
                          'Mobil Servis : Erişim Başarılı',
                          style: TextStyle(color: Colors.green),
                        )
                      : TestProvider().accessTestV2 == 'false'
                          ? const Text(
                              'Mobil Servis : Erişim Başarısız',
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text(
                              'Mobil Servis : Erişim Bekleniyor...',
                              style: TextStyle(color: Colors.orange),
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox buttonTest(BuildContext context, String buttonText, onPressFunction,
    controllerButton) {
  return SizedBox(
    width: context.width * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedLoadingButton(
        color: APPColors.Main.red,
        successColor: Colors.amber,
        controller: controllerButton,
        onPressed: () {
          Timer(Duration(seconds: 1), () {
            onPressFunction();
            controllerButton.success();
            controllerButton.reset();
          });
        },
        valueColor: Colors.white,
        borderRadius: 12,
        child: Center(
          child: Text(
              buttonText == AppStrings.accessTest
                  ? AppStrings.accessTest
                  : AppStrings.issueNotify,
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}

SizedBox buttonNotify(BuildContext context, String buttonText, onPressFunction,
    controllerButton) {
  return SizedBox(
    width: context.width * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedLoadingButton(
        color: APPColors.Main.red,
        successColor: Colors.amber,
        controller: controllerButton,
        onPressed: () => onPressFunction(),
        valueColor: Colors.white,
        borderRadius: 12,
        child: Center(
          child: Text(
              buttonText == AppStrings.accessTest
                  ? AppStrings.accessTest
                  : AppStrings.issueNotify,
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}
