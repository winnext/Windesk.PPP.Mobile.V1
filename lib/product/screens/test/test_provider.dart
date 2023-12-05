import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';
import 'service/test_service_repo_impl.dart';

import '../../../feature/database/shared_manager.dart';
import '../../../feature/enums/shared_enums.dart';

class TestProvider extends ChangeNotifier {
  final TestServiceRepositoryImpl testServices = TestServiceRepositoryImpl();
  void checkUserAlreadyLoggedIn() {}

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _accessTestV1 = 'loading';
  get accessTestV1 => _accessTestV1;

  set setAccessTestV1(String accessTestV1) {
    _accessTestV1 = accessTestV1;
    notifyListeners();
  }

  String _accessTestV2 = 'loading';
  get accessTestV2 => _accessTestV2;

  set setAccessTestV2(String accessTestV2) {
    _accessTestV2 = accessTestV2;
  }

  bool _getInfoLoad = false;
  get getInfoLoad => _getInfoLoad;
  set setGetInfoLoad(bool getInfoLoad) {
    _getInfoLoad = getInfoLoad;
  }

  String _deviceModel = '';
  get deviceModel => _deviceModel;
  set setDeviceModel(String deviceModel) {
    _deviceModel = deviceModel;
  }

  String _deviceOS = '';
  get deviceOS => _deviceOS;
  set setDeviceOS(String deviceOS) {
    _deviceOS = deviceOS;
  }

  String _appVersion = '';
  get appVersion => _appVersion;
  set setAppVersion(String appVersion) {
    _appVersion = appVersion;
  }

  String _serverTime = '';
  get serverTime => _serverTime;
  set setServerTime(String serverTime) {
    String yil = serverTime[0] + serverTime[1] + serverTime[2] + serverTime[3];
    String ay = serverTime[4] + serverTime[5];
    String gun = serverTime[6] + serverTime[7];
    String saat = serverTime[8] + serverTime[9];
    String dakika = serverTime[10] + serverTime[11];
    String saniye = serverTime[12] + serverTime[13];
    _serverTime = '$gun/$ay/$yil $saat:$dakika:$saniye';
  }

  String _phoneTime = '';
  get phoneTime => _phoneTime;
  set setPhoneTime(String phoneTime) {
    _phoneTime = phoneTime;
  }
    String _userName = '';
  get userName => _userName;
  set setUserName(String userName) {
    _userName = userName;
  }
    String _userCode = '';
  get userCode => _userCode;
  set setUserCode(String userCode) {
    _userCode = userCode;
  }

  void getTestScreenInfo() async {
    setGetInfoLoad = true;
    setDeviceModel = await SharedManager().getString(SharedEnum.deviceModel);
    setDeviceOS = await SharedManager().getString(SharedEnum.deviceType);
    setAppVersion = await SharedManager().getString(SharedEnum.appVersion);
    setUserName = await SharedManager().getString(SharedEnum.userName);
    setUserCode = await SharedManager().getString(SharedEnum.userCode);
    notifyListeners();
  }

  bool _invalidDeviceId = false;
  get invalidDeviceId => _invalidDeviceId;

  void getServerTime(context) async {
    String token = await SharedManager().getString(SharedEnum.deviceId);
    var getServerTimeResult = await testServices.getServerTime(token);
    getServerTimeResult.fold(
      (l) => {
       
        if (l == 'Invalid device Id')
          {
            snackBar(context, 'Oturumunuz sonlandırıldı.', 'error'),
          
            _invalidDeviceId = true,
          }
        else
          {
            setServerTime = l,
            ElasticLog().sendLog('info', 'ServerTimeSuccess',
                'Sunucu saati başarıyla çekildi.', 'serverTimeSuccess'),
          }
      },
      (r) => {
        ElasticLog().sendLog('error', 'ServerTimeFail',
            'Sunucu saati alınamadı.', 'serverTimeFail'),
      },
    );
  }

  void getPhoneTime() {
    DateTime now = DateTime.now();
    int gun = now.day;
    int ay = now.month;
    int yil = now.year;

    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    setPhoneTime = '$gun/$ay/$yil $hour:$minute:$second';
    notifyListeners();
  }

  void accessTestV1Function(context) async {
    getServerTime(context);
    getPhoneTime();
    setAccessTestV1 = 'loading';
    notifyListeners();
    var accesTestResult = await testServices.accessTestWindesk();
    accesTestResult.fold(
        (l) => {
              ElasticLog().sendLog('info', 'V1TestSuccess',
                  'Windesk erişimi başarılı', 'v1TestSuccess'),
              setAccessTestV1 = 'true'
            },
        (r) => {
              setAccessTestV1 = 'false',
              ElasticLog().sendLog('error', 'V1TestFail',
                  'Windesk erişimi başarısız.', 'v1TestFail'),
            });
    notifyListeners();
  }

  void accessTestV2Function() async {
    setAccessTestV2 = 'loading';
    notifyListeners();

    var accesTestResult = await testServices.accessTestMobileService();
    accesTestResult.fold(
        (l) => {
              ElasticLog().sendLog('info', 'V2TestSuccess',
                  'Mobil servis erişimi başarılı', 'v2TestSuccess'),
              setAccessTestV2 = 'true'
            },
        (r) => {
              setAccessTestV2 = 'false',
              ElasticLog().sendLog('error', 'V2TestFail',
                  'Mobil servis erişimi başarısız.', 'v2TestFail'),
            });

    notifyListeners();
  }
}
