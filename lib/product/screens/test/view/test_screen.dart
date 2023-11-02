import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../feature/components/appbar/custom_tab_appbar.dart';
import '../../../../feature/constants/other/app_strings.dart';
import '../../../../feature/constants/other/colors.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../../../../feature/global_providers/global_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => TestProvider(),
      child: Consumer<TestProvider>(
          builder: (context, TestProvider testProvider, child) {
        testProvider.getInfoLoad == false
            ? testProvider.getTestScreenInfo()
            : null;
        return Scaffold(
          appBar: const CustomTabAppbar(title: AppStrings.testTab),
          body: Center(child: _bodyWidget(context, testProvider)),
        );
      }),
    );
  }

  _bodyWidget(BuildContext context, TestProvider testProvider) {
    return Column(
      children: [
        _headerWidget(context),
        _infoWidget(context, testProvider),
        _buttonsAndTestResultWidget(context, testProvider),
      ],
    );
  }

  Widget _pictureWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Image.asset(
          'assets/images/profile3.png',
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _pictureWidget(context),
            const Text(
              AppStrings.windeskHelp,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(context.read<GlobalProvider>().userName),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(BuildContext context, TestProvider testProvider) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ServiceTools.facilityName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(AppStrings.device +
                context.read<TestProvider>().deviceModel.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(AppStrings.os +
                context.read<TestProvider>().deviceOS.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(AppStrings.appVersion +
                context.read<TestProvider>().appVersion.toString()),
          ),
          Expanded( 
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    AppStrings.connectionTime,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(AppStrings.serverTime + testProvider.serverTime),
                  Text(AppStrings.phoneTime + testProvider.phoneTime),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonsAndTestResultWidget(
      BuildContext context, TestProvider testProvider) {
    return Expanded(
      child: Column(
        children: [
          // buttonNotify(context, AppStrings.issueNotify, onPressFunction,
          //     _controllerButton),
          buttonTest(
              context, AppStrings.accessTest, testProvider, _controllerButton),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: testProvider.accessTestV1 == 'true'
                      ? const Text(
                          AppStrings.windeskSuccess,
                          style: TextStyle(color: Colors.green),
                        )
                      : testProvider.accessTestV1 == 'false'
                          ? const Text(
                              AppStrings.windeskConnFail,
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text(
                              AppStrings.windeskConnWait,
                              style: TextStyle(color: Colors.orange),
                            ),
                ),
                Container(
                  child: testProvider.accessTestV2 == 'true'
                      ? const Text(
                          AppStrings.mobilServerSuccess,
                          style: TextStyle(color: Colors.green),
                        )
                      : testProvider.accessTestV2 == 'false'
                          ? const Text(
                              AppStrings.mobilServerConnFail,
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text(
                              AppStrings.mobilServerConnWait,
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

SizedBox buttonTest(BuildContext context, String buttonText,
    TestProvider testProvider, controllerButton) {
  return SizedBox(
    width: context.width * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedLoadingButton(
        color: APPColors.Main.red,
        successColor: Colors.amber,
        controller: controllerButton,
        onPressed: () {
          controllerButton.success();
          testProvider.accessTestV1Function();
          testProvider.accessTestV2Function();

          controllerButton.reset();
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
