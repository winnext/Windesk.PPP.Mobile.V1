import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vm_fm_4/product/screens/test/test_provider.dart';

import '../service/test_service_repo_impl.dart';

@RoutePage()
class TestScreen extends StatefulWidget {
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final RoundedLoadingButtonController _controllerButton = RoundedLoadingButtonController();

  RoundedLoadingButtonController get controllerButton => _controllerButton;

  void connectionTest(RoundedLoadingButtonController controller) async {

    TestServiceRepositoryImpl x = TestServiceRepositoryImpl();
    final result = await x.accessTestMobileService();

    print('result' + result.toString());

    if (result == 'success') {
      setState(() {
              _controllerButton.success();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestProvider(),
      child: Consumer<TestProvider>(
        builder: (context, TestProvider testProvider, child) {
        return SizedBox(
          width: 45,
          height: 6,
          child: RoundedLoadingButton(
            color: Colors.red,
            successColor: Colors.amber,
            controller: _controllerButton,
            onPressed: () => connectionTest(_controllerButton),
            valueColor: Colors.white,
            borderRadius: 20,
            child: Center(
              child: Text('Erişim Testi', style: TextStyle(color: Colors.white)),
            ),
          ),
        );
                }
      ),
    );
  }
}
