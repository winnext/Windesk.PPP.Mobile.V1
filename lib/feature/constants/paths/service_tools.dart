import 'package:flutter/material.dart';

@immutable
class ServiceTools {
  const ServiceTools._();

  static const String baseUrlV1 =
      'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobile.signumtte.com';
  static const tokenV1 = 'wddemo!_';
  static const tokenV2 = 'demo!';
  static const attachPath = "https://demo.signumtte.com/windesk";
  static const attachPathLive =
      "http://10.32.12.42/windesktest/xreadattach.php?token=$tokenV1&id=";
  static const facilityName = "İstanbul Finans Merkezi";

  //// ESH PREPROD
// const PPP_PROJECT = "esh";
// const BASE_URL_V2 = 'http://windeskmobiletest.eskisehir.yerel';
// const TOKEN_V1 = 'wdeshtest!_';
// const TOKEN_V2 = 'eshtest!';
// const ATTACHPATHLIVE =
//     "http://10.126.12.21/esh/xreadattach.php?token=${TOKEN_V1}&id=";
// const base_url_v1 =
//     'http://10.126.12.21/esh/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=' +
//         'wdmobile' +
//         '&wspassword=' +
//         'wdsgnm1017_' +
//         '&token=';

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
