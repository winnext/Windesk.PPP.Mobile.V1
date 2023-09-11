import 'package:flutter/material.dart';

@immutable
class ServiceTools {
  //const ServiceTools._();

//Signum ortamı
  // static const String baseUrlV1 =
  //     'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  // static const String baseUrlV2 = 'http://windeskmobile.signumtte.com';
  // static const tokenV1 = 'wddemo!_';2
  // static const tokenV2 = 'demo!';
  // static const attachPath = "https://demo.signumtte.com/windesk";
  // static const attachPathLive = "http://10.32.12.42/windesktest/xreadattach.php?token=$tokenV1&id=";
  // static const facilityName = "İstanbul Finans Merkezi";
//ESH PREPROD
  static const String baseUrlV1 =
      'http://10.126.12.21/esh3/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobiletest.eskisehir.yerel';
  static const tokenV1 = 'wdeshtest!_';
  static const tokenV2 = 'eshtest!';
  static const attachPath = "http://10.126.12.21/esh3";
  static const attachPathLive =
      "http://10.126.12.21/esh3/xreadattach.php?token=$tokenV1&id=";
  static const facilityName = "Eskişehir Şehir Hastanesi";
  static const appName = "ESH";

  // GSH PREPROD
  // static const pppProject = "antep";
  // static const baseUrlV2 = 'http://wd-mobile-test.gaziantep.yerel';
  // static const tokenV1 = 'anteptest!_';
  // static const tokenV2 = 'anteptest!';

  // static const attachPath = "http://geskwdtestapp.gaziantep.yerel/windesk";
  // static const attachPathLive = "http://geskwdtestapp.gaziantep.yerel/windesk/xreadattach.php?token=$tokenV1&id=";
  // static const baseUrlV1 =
  //     'http://geskwdtestapp.gaziantep.yerel/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  // static const facilityName = 'Gaziantep Şehir Hastanesi';

  // static const String baseUrlV1 =
  //     'http://geskwdtestapp.gaziantep.yerel/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  // static const String baseUrlV2 = 'http://wd-mobile-test.gaziantep.yerel';
  // static const tokenV1 = 'anteptest!_';
  // static const tokenV2 = 'anteptest!';
  // static const attachPath = "http://geskwdtestapp.gaziantep.yerel/windesk";
  // static const attachPathLive =
  //     "http://geskwdtestapp.gaziantep.yerel/windesk/xreadattach.php?token=$tokenV1&id=";
  // static const facilityName = "Gaziantep Şehir Hastanesi";
}
