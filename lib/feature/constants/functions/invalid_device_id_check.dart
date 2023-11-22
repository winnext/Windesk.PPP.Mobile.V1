import 'dart:async';

import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/product/screens/home/provider/home_provider.dart';
import 'package:wm_ppp_4/product/screens/test/service/test_service_repo_impl.dart';
import 'package:restart_app/restart_app.dart';

class InvalidDeviceId {
  final TestServiceRepositoryImpl testServices = TestServiceRepositoryImpl();
  HomeProvider homeProvider = HomeProvider();
  check(context) async {
    String token = await SharedManager().getString(SharedEnum.deviceId);
    var getServerTimeResult = await testServices.getServerTime(token);
    getServerTimeResult.fold(
      (l) => {
        if (l == 'Invalid device Id')
          {
            snackBar(context, 'Oturumunuz sonlandırıldı.', 'error'),
            homeProvider.logOut(),
            Timer(Duration(seconds: 1), () {
              Restart.restartApp();
            })
          }
      },
      (r) => {null},
    );
  }
}
